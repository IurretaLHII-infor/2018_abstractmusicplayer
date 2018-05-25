package com.example.bortu.abstractmusic;

import android.app.Activity;
import android.content.Context;
import android.content.Intent;
import android.content.SharedPreferences;
import android.media.MediaPlayer;
import android.os.Bundle;
import android.os.Handler;
import android.view.View;
import android.widget.ImageView;
import android.widget.SeekBar;
import android.widget.TextView;
import android.widget.Toast;

import org.json.JSONException;

import java.io.IOException;
import java.util.ArrayList;
import java.util.concurrent.TimeUnit;

import Objects.APIGet;
import Objects.MediaPlayerFactory;
import Objects.OAlbum;
import Objects.OArtist;
import Objects.OSong;
import Objects.Utils;

public class AtPlayer extends Activity {

    //Declarations
    private static ImageView playerCover;
    private static TextView playerSongName;
    private static TextView playerAlbumName;
    private static TextView playerArtistName;
    private static ImageView playerPrevButton;
    private static ImageView playerPlayPauseButton;
    private static ImageView playerNextButton;
    private static TextView playerCurrentTime;
    private static SeekBar playerSeekBar;
    private static TextView playerSongTime;
    private static ImageView playerShuffleButton;
    private static ImageView playerRepeatButton;
    private static MediaPlayer mp;
    private static int songNumber = 0;

    private Handler myHandler;
    private int curSongTime;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_at_player);

        //Link layout objects with class objects
        playerCover = (ImageView) findViewById(R.id.playerCover);
        playerSongName = (TextView) findViewById(R.id.playerSongName);
        playerAlbumName = (TextView) findViewById(R.id.playerAlbumName);
        playerArtistName = (TextView) findViewById(R.id.playerArtistName);
        playerPrevButton = (ImageView) findViewById(R.id.playerPrevButton);
        playerPlayPauseButton = (ImageView) findViewById(R.id.playerPlayPauseButton);
        playerNextButton = (ImageView) findViewById(R.id.playerNextButton);
        playerCurrentTime = (TextView) findViewById(R.id.playerCurrentTime);
        playerSeekBar = (SeekBar) findViewById(R.id.playerSeekBar);
        playerSongTime = (TextView) findViewById(R.id.playerSongTime);
        playerShuffleButton = (ImageView) findViewById(R.id.playerShuffleButton);
        playerRepeatButton = (ImageView) findViewById(R.id.playerRepeatButton);

        //Get media player from factory and init handler
        mp = MediaPlayerFactory.getMediaPlayer();
        if (Utils.playCurrentSong(AtPlayer.this, mp)) {
            playerPlayPauseButton.setImageResource(R.drawable.pause);
        } else {
            playerPlayPauseButton.setImageResource(R.drawable.play);
        }
        myHandler = new Handler();
        myHandler.postDelayed(UpdateSongTime, 100);

        //Initialize player screen values
        initPlayer(AtPlayer.this, mp);

        //Go to song's album
        playerAlbumName.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                Intent iAlbum = new Intent(AtPlayer.this, AtAlbum.class);
                iAlbum.putExtra("albumNumber", 0);
                startActivity(iAlbum);
            }
        });

        //Go to song's artist
        playerArtistName.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                Intent iArtist = new Intent(AtPlayer.this, AtArtist.class);
                iArtist.putExtra("artistNumber", 0);
                startActivity(iArtist);
            }
        });

        //Go to previous song
        playerPrevButton.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                Utils.previousSong(AtPlayer.this, mp);
                updateSongInfo(AtPlayer.this);
                //If mediaplayer was playing, play new selected song
                if (mp.isPlaying()) {
                    if (Utils.playCurrentSong(AtPlayer.this, mp)) {
                        playerPlayPauseButton.setImageResource(R.drawable.pause);
                    } else {
                        playerPlayPauseButton.setImageResource(R.drawable.play);
                    }
                    updateSBandCurSongTime();
                }
            }
        });

        //Play or pause the song
        playerPlayPauseButton.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                if (mp.isPlaying()) {
                    mp.pause();
                    playerPlayPauseButton.setImageResource(R.drawable.play);
                } else {
                    mp.start();
                    updateSBandCurSongTime();
                    playerPlayPauseButton.setImageResource(R.drawable.pause);
                }
            }
        });

        //Go to next song
        playerNextButton.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {

                Utils.nextSong(AtPlayer.this, mp);
                updateSongInfo(AtPlayer.this);
                if (mp.isPlaying()) {
                    playerPlayPauseButton.setImageResource(R.drawable.pause);
                    updateSBandCurSongTime();
                }
                else {
                    playerPlayPauseButton.setImageResource(R.drawable.play);
                }
            }
        });

        //Change shuffle mode
        playerShuffleButton.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                SharedPreferences pref = AtPlayer.this.getApplicationContext().getSharedPreferences("myPref", MODE_PRIVATE);
                boolean shuffle = pref.getBoolean("shuffle", false);
                if (shuffle == false) {
                    shuffle = true;
                    playerShuffleButton.setImageResource(R.drawable.shuffle_on);
                } else {
                    shuffle = false;
                    playerShuffleButton.setImageResource(R.drawable.shuffle_off);
                }
                SharedPreferences.Editor editor = pref.edit();
                editor.putBoolean("shuffle", shuffle);
                editor.apply();
            }
        });

        //Set repeat mode
        playerRepeatButton.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                SharedPreferences pref = AtPlayer.this.getApplicationContext().getSharedPreferences("myPref", MODE_PRIVATE);
                boolean repeat = pref.getBoolean("repeat", false);
                if (repeat == false) {
                    repeat = true;
                    playerRepeatButton.setImageResource(R.drawable.repeat_on);
                } else {
                    repeat = false;
                    playerRepeatButton.setImageResource(R.drawable.repeat_off);
                }
                SharedPreferences.Editor editor = pref.edit();
                editor.putBoolean("repeat", repeat);
                editor.apply();
            }
        });

        //SeekBar Listener
        playerSeekBar.setOnSeekBarChangeListener(new SeekBar.OnSeekBarChangeListener() {

            @Override
            public void onStopTrackingTouch(SeekBar seekBar) {

            }

            @Override
            public void onProgressChanged(SeekBar seekBar, int progress, boolean fromUser) {
                if (mp != null && fromUser) {
                    mp.seekTo(progress);
                }
            }

            @Override
            public void onStartTrackingTouch(SeekBar seekBar) {

            }

        });

        //When song finishes play next one
        mp.setOnCompletionListener(new MediaPlayer.OnCompletionListener() {
            @Override
            public void onCompletion(MediaPlayer mp) {
                //if(mp.isPlaying()){
                Utils.nextSong(AtPlayer.this, mp);
                if (mp.isPlaying()) {
                    playerPlayPauseButton.setImageResource(R.drawable.pause);
                } else {
                    playerPlayPauseButton.setImageResource(R.drawable.play);
                }
                updateSongInfo(AtPlayer.this);
                updateSBandCurSongTime();
                //}

            }
        });

    }

    //Update current time of song
    private Runnable UpdateSongTime = new Runnable() {
        public void run() {

            curSongTime = mp.getCurrentPosition();
            playerCurrentTime.setText(String.format("%d : %d",
                    TimeUnit.MILLISECONDS.toMinutes((long) curSongTime),
                    TimeUnit.MILLISECONDS.toSeconds((long) curSongTime) -
                            TimeUnit.MINUTES.toSeconds(TimeUnit.MILLISECONDS.
                                    toMinutes((long) curSongTime))));
            playerSeekBar.setProgress((int) curSongTime);
            myHandler.postDelayed(this, 100);
        }

    };

    //Set default values on each layout
    private void initPlayer(Context context, MediaPlayer mp) {

        updateSongInfo(context);
        updateSBandCurSongTime();
        if (mp.isPlaying()) {
            playerPlayPauseButton.setImageResource(R.drawable.pause);
        } else {
            playerPlayPauseButton.setImageResource(R.drawable.play);
        }
        if (Utils.getShuffle(AtPlayer.this) == true) {
            playerShuffleButton.setImageResource(R.drawable.shuffle_on);
        } else {
            playerShuffleButton.setImageResource(R.drawable.shuffle_off);
        }
        if (Utils.getRepeat(AtPlayer.this) == true) {
            playerRepeatButton.setImageResource(R.drawable.repeat_on);
        } else {
            playerRepeatButton.setImageResource(R.drawable.repeat_off);
        }

    }

    //Update artist, album and song info
    private void updateSongInfo(Context context) {
        songNumber = Utils.getCurrentSong(context);
        if (songNumber != 0) {
            ArrayList<String> songInfo = null;
            try {
                songInfo = APIGet.getSongInfo(context, songNumber);
            } catch (IOException e) {
                e.printStackTrace();
            }
            if (songInfo != null) {
                //KUNGFU.cargar portada si se implementa el metodo
                playerCover.setImageResource(R.drawable.logo200);
                playerArtistName.setText(songInfo.get(0));
                playerAlbumName.setText(songInfo.get(1));
                playerSongName.setText(songInfo.get(2));
            } else {
                //In case song is not loaded, put default values to the layout
                playerCover.setImageResource(R.drawable.logo200);
                playerSongName.setText("Song name not found");
                playerAlbumName.setText("Album name not found");
                playerArtistName.setText("Artist name not found");
            }

        } else {
            //In case song is not loaded, put default values to the layout
            playerCover.setImageResource(R.drawable.logo200);
            playerSongName.setText("Song name not found");
            playerAlbumName.setText("Album name not found");
            playerArtistName.setText("Artist name not found");
        }
    }

    //Set max value for seek bar and lenght of song
    private void updateSBandCurSongTime() {
        if (Utils.getCurrentSong(AtPlayer.this) != 0 && mp.isPlaying()) {
            playerSeekBar.setMax(mp.getDuration());
            playerSongTime.setText(String.format("%d : %d",
                    TimeUnit.MILLISECONDS.toMinutes((long) mp.getDuration()),
                    TimeUnit.MILLISECONDS.toSeconds((long) mp.getDuration()) -
                            TimeUnit.MINUTES.toSeconds(TimeUnit.MILLISECONDS.
                                    toMinutes((long) mp.getDuration())))
            );
        } else {
            playerSeekBar.setMax(0);
            playerSongTime.setText("00:00");
        }

    }

}
