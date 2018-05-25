package com.example.bortu.abstractmusic;

import android.app.Activity;
import android.content.Intent;
import android.media.MediaPlayer;
import android.os.Bundle;
import android.view.View;
import android.widget.AdapterView;
import android.widget.ArrayAdapter;
import android.widget.Button;
import android.widget.LinearLayout;
import android.widget.ListView;
import android.widget.TextView;
import android.widget.Toast;
import org.json.JSONArray;
import org.json.JSONException;
import java.util.ArrayList;
import Objects.APIGet;
import Objects.MediaPlayerFactory;
import Objects.Utils;

public class AtMain extends Activity {

    //Declarations
    LinearLayout mainGenreLayout;
    LinearLayout mainSubgenreLayout;
    LinearLayout mainArtistLayout;
    LinearLayout mainAlbumLayout;
    LinearLayout mainSongLayout;
    TextView mainGenre;
    TextView mainSubgenre;
    TextView mainArtist;
    TextView mainAlbum;
    TextView mainSong;
    TextView mainRecomendation;
    ListView mainList;
    ArrayAdapter<String> listAdapter;
    Button mainPlay;
    Button mainPlayer;
    Button mainLogout;

    //Lists which will be filled with data once the petition is made
    JSONArray responseArray;
    ArrayList<Integer> idList;
    ArrayList<String> nameList;

    //Variables to save filter values
    int selectedGenre = 0;
    int selectedSubgenre = 0;
    int selectedArtist = 0;
    int selectedAlbum = 0;
    int selectedSong = 0;
    int selectedRecomendation = 0;
    String noGenre = "Select a genre";
    String noSubgenre = "Select a subgenre";
    String noArtist = "Select an artist";
    String noAlbum = "Select an album";
    String noSong = "Select a song";

    //Variables to know where to put/ask for data
    int searchMode;
    final int genreMode = 99;
    final int subgenreMode = 0;
    final int artistMode = 1;
    final int albumbysubgenreMode = 2;
    final int albumbyartistMode = 3;
    final int songMode = 4;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_at_main);

        //Get MediaPlayer
        final MediaPlayer mp = MediaPlayerFactory.getMediaPlayer();

        //Link variables with layout objects
        mainGenreLayout = (LinearLayout) findViewById(R.id.mainGenreLayout);
        mainSubgenreLayout = (LinearLayout) findViewById(R.id.mainSubgenreLayout);
        mainArtistLayout = (LinearLayout) findViewById(R.id.mainArtistLayout);
        mainAlbumLayout = (LinearLayout) findViewById(R.id.mainAlbumLayout);
        mainSongLayout = (LinearLayout) findViewById(R.id.mainSongLayout);
        mainGenre = (TextView) findViewById(R.id.mainGenre);
        mainSubgenre = (TextView) findViewById(R.id.mainSubgenre);
        mainArtist = (TextView) findViewById(R.id.mainArtist);
        mainAlbum = (TextView) findViewById(R.id.mainAlbum);
        mainSong = (TextView) findViewById(R.id.mainSong);
        mainRecomendation = (TextView) findViewById(R.id.mainRecomendation);
        mainPlay = (Button) findViewById(R.id.mainPlay);
        mainPlayer = (Button) findViewById(R.id.mainPlayer);
        mainLogout = (Button) findViewById(R.id.mainLogout);
        nameList = new ArrayList<String>();
        idList = new ArrayList<Integer>();
        mainList = (ListView) findViewById(R.id.mainList);
        listAdapter = new ArrayAdapter<String>(AtMain.this, R.layout.listview_customlayout, nameList);
        mainList.setAdapter(listAdapter);

        //Search for genres
        mainGenre.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                searchMode = genreMode;
                responseArray = APIGet.getGenres(AtMain.this, false);
                if (responseArray != null) {
                    chargeList(responseArray);
                } else {
                    Toast.makeText(AtMain.this, "Can not get genres now, try again later", Toast.LENGTH_LONG).show();
                }
            }
        });

        //Search for subgenres
        mainSubgenre.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                searchMode = subgenreMode;
                if (selectedGenre != 0) {
                    responseArray = APIGet.getListObjects(AtMain.this, searchMode, selectedGenre);
                    if (responseArray != null) {
                        chargeList(responseArray);
                    } else {
                        Toast.makeText(AtMain.this, "Can not get subgenres now, try again later", Toast.LENGTH_LONG).show();
                    }
                } else {
                    Toast.makeText(AtMain.this, "You must first select a genre", Toast.LENGTH_LONG).show();
                }
            }
        });

        //Search for artists
        mainArtist.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                searchMode = artistMode;
                if (selectedGenre != 0) {
                    responseArray = APIGet.getListObjects(AtMain.this, searchMode, selectedGenre);
                    if (responseArray != null) {
                        chargeList(responseArray);
                    } else {
                        Toast.makeText(AtMain.this, "Can not get artists now, try again later", Toast.LENGTH_LONG).show();
                    }
                } else {
                    Toast.makeText(AtMain.this, "You must first select a genre", Toast.LENGTH_LONG).show();
                }
            }
        });

        //Search for albums
        mainAlbum.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                //Set search mode depending if you have selected an artist or a subgenre
                if (selectedArtist != 0) {
                    searchMode = albumbyartistMode;
                } else if (selectedSubgenre != 0) {
                    searchMode = albumbysubgenreMode;
                }
                //If neither of them is selected, don't let begin the search of album
                if (searchMode == albumbyartistMode || searchMode == albumbysubgenreMode) {
                    if (searchMode == albumbyartistMode) {
                        responseArray = APIGet.getListObjects(AtMain.this, searchMode, selectedArtist);
                    } else {
                        responseArray = APIGet.getListObjects(AtMain.this, searchMode, selectedSubgenre);
                    }
                    if (responseArray != null) {
                        chargeList(responseArray);
                    } else {
                        Toast.makeText(AtMain.this, "Can not get albums now, try again later", Toast.LENGTH_LONG).show();
                    }
                } else {
                    Toast.makeText(AtMain.this, "You must first select a subgenre or an artist", Toast.LENGTH_LONG).show();
                }
            }
        });

        //Search for songs
        mainSong.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                if (selectedAlbum != 0) {
                    searchMode = songMode;
                    responseArray = APIGet.getListObjects(AtMain.this, searchMode, selectedAlbum);
                    if (responseArray != null) {
                        chargeList(responseArray);
                    } else {
                        Toast.makeText(AtMain.this, "Can not get songs now, try again later", Toast.LENGTH_LONG).show();
                    }
                } else {
                    Toast.makeText(AtMain.this, "You must first select an album or an artist", Toast.LENGTH_LONG).show();
                }
            }
        });
        //Listen to recomendation
        mainRecomendation.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                if (selectedRecomendation != 0) {
                    //KUNGFU.recomendaciones
                } else {
                    Toast.makeText(AtMain.this, "No current recomendation available", Toast.LENGTH_LONG).show();
                }
            }
        });

        //Play selected album or song
        mainPlay.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                ArrayList<Integer> newPlaylist = null;
                boolean isPlayable = false;
                if (selectedSong != 0) {
                    newPlaylist = new ArrayList<Integer>();
                    newPlaylist.add(selectedSong);
                    Utils.updatePlaylist(AtMain.this, newPlaylist);
                    isPlayable = true;
                } else if (selectedAlbum != 0) {
                    newPlaylist = getSongsFromAlbum(selectedAlbum);
                    if(newPlaylist != null && newPlaylist.size() > 0){
                        Utils.updatePlaylist(AtMain.this, newPlaylist);
                        isPlayable = true;
                    }
                    else{
                        isPlayable = false;
                    }
                }
                else{
                    Toast.makeText(AtMain.this, "You must select an album or an artist to play music", Toast.LENGTH_LONG).show();
                }
                if(isPlayable){
                    Intent iPlayer = new Intent(AtMain.this, AtPlayer.class);
                    startActivity(iPlayer);
                }
            }
        });

        //Go to player
        mainPlayer.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                if(mp.isPlaying()){
                    Intent iPlayer = new Intent(AtMain.this, AtPlayer.class);
                    startActivity(iPlayer);
                }
                else{
                    Toast.makeText(AtMain.this, "You must be playing music in order to enter the player screen", Toast.LENGTH_LONG).show();
                }
            }
        });

        //Logout
        mainLogout.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                Utils.logout(AtMain.this);
                Intent iLogin = new Intent(AtMain.this, AtLogin.class);
                startActivity(iLogin);
                finish();
            }
        });

        //Listener for list items
        mainList.setOnItemClickListener(new AdapterView.OnItemClickListener() {
            @Override
            public void onItemClick(AdapterView<?> parent, View view, int position, long id) {
                if (searchMode == genreMode) {
                    selectedGenre = idList.get(position);
                    mainGenre.setText(nameList.get(position));
                    selectedSubgenre = 0;
                    mainSubgenre.setText(noSubgenre);
                    selectedArtist = 0;
                    mainArtist.setText(noArtist);
                    selectedAlbum = 0;
                    mainAlbum.setText(noAlbum);
                    selectedSong = 0;
                    mainSong.setText(noSong);
                    setVisibleLayouts(true, true, true, false, false);
                    nameList.clear();
                    idList.clear();
                    listAdapter.notifyDataSetChanged();
                } else if (searchMode == subgenreMode) {
                    selectedSubgenre = idList.get(position);
                    mainSubgenre.setText(nameList.get(position));
                    selectedArtist = 0;
                    mainArtist.setText(noArtist);
                    selectedAlbum = 0;
                    mainAlbum.setText(noAlbum);
                    selectedSong = 0;
                    mainSong.setText(noSong);
                    setVisibleLayouts(true, true, false, true, false);
                    nameList.clear();
                    idList.clear();
                    listAdapter.notifyDataSetChanged();
                } else if (searchMode == artistMode) {
                    selectedArtist = idList.get(position);
                    mainArtist.setText(nameList.get(position));
                    selectedSubgenre = 0;
                    mainSubgenre.setText(noSubgenre);
                    selectedAlbum = 0;
                    mainAlbum.setText(noAlbum);
                    mainAlbum.setText(noAlbum);
                    selectedSong = 0;
                    mainSong.setText(noSong);
                    setVisibleLayouts(true, false, true, true, false);
                    idList.clear();
                    nameList.clear();
                    listAdapter.notifyDataSetChanged();
                } else if (searchMode == albumbysubgenreMode) {
                    selectedAlbum = idList.get(position);
                    mainAlbum.setText(nameList.get(position));
                    selectedArtist = 0;
                    mainArtist.setText(noArtist);
                    selectedSong = 0;
                    mainSong.setText(noSong);
                    setVisibleLayouts(true, true, false, true, true);
                    idList.clear();
                    nameList.clear();
                    listAdapter.notifyDataSetChanged();
                } else if (searchMode == albumbyartistMode) {
                    selectedAlbum = idList.get(position);
                    mainAlbum.setText(nameList.get(position));
                    selectedSubgenre = 0;
                    mainSubgenre.setText(noSubgenre);
                    selectedSong = 0;
                    mainSong.setText(noSong);
                    setVisibleLayouts(true, false, true, true, true);
                    idList.clear();
                    nameList.clear();
                    listAdapter.notifyDataSetChanged();
                } else if (searchMode == songMode) {
                    selectedSong = idList.get(position);
                    mainSong.setText(nameList.get(position));
                    idList.clear();
                    nameList.clear();
                    listAdapter.notifyDataSetChanged();
                }
            }
        });
    }

    //Fill list with received array
    private void chargeList(JSONArray responseArray) {
        idList.clear();
        nameList.clear();
        for (int i = 0; i < responseArray.length(); i++) {
            try {
                idList.add(responseArray.getJSONObject(i).getInt("id"));
                nameList.add(responseArray.getJSONObject(i).getString("name"));
            } catch (JSONException e) {
                Toast.makeText(AtMain.this, "There was a problem completing the list, try again later", Toast.LENGTH_LONG).show();
            }
        }
        if (nameList.size() > 0) {
            listAdapter.notifyDataSetChanged();
        } else {
            Toast.makeText(AtMain.this, "Could not load list, try again later", Toast.LENGTH_LONG).show();
        }
    }

    //Change visible filter layouts
    private void setVisibleLayouts(boolean genre, boolean subgenre, boolean artist, boolean album, boolean song) {
        if (genre == true) {
            mainGenreLayout.setVisibility(View.VISIBLE);
        } else {
            mainGenreLayout.setVisibility(View.INVISIBLE);
        }
        if (subgenre == true) {
            mainSubgenreLayout.setVisibility(View.VISIBLE);
        } else {
            mainSubgenreLayout.setVisibility(View.INVISIBLE);
        }
        if (artist == true) {
            mainArtistLayout.setVisibility(View.VISIBLE);
        } else {
            mainArtistLayout.setVisibility(View.INVISIBLE);
        }
        if (album == true) {
            mainAlbumLayout.setVisibility(View.VISIBLE);
        } else {
            mainAlbumLayout.setVisibility(View.INVISIBLE);
        }
        if (song == true) {
            mainSongLayout.setVisibility(View.VISIBLE);
        } else {
            mainSongLayout.setVisibility(View.INVISIBLE);
        }
    }

    //Get songs from album selected in filter
    private ArrayList<Integer> getSongsFromAlbum(int albumId){
        ArrayList<Integer> songList = null;
        JSONArray JSONSongList = APIGet.getListObjects(AtMain.this, songMode, albumId);
        if(JSONSongList != null){
            songList = new ArrayList<Integer>();
            for(int i = 0; i<JSONSongList.length();i++){
                try {
                    songList.add(JSONSongList.getJSONObject(i).getInt("id"));
                } catch (JSONException e) {
                    Toast.makeText(AtMain.this, "Error getting songs for selected album, try again later", Toast.LENGTH_LONG).show();
                }
            }
        }
        return songList;
    }
}
