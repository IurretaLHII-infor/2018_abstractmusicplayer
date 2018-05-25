//This class will ensure we always use the same mediaplayer, so that the audio doesn't duplicate or mix

package Objects;


import android.media.AudioManager;
import android.media.MediaPlayer;

/**
 * Created by abstract on 09-Mar-18.
 */

public class MediaPlayerFactory extends MediaPlayer {

    private static MediaPlayer mp;
    //If there is a MediaPlayer alredy created, return it
    //In case there is no MediaPlayer created, create one and return it
    public static MediaPlayer getMediaPlayer() {
        if (mp == null) {
            mp = new MediaPlayer();
            mp.setAudioStreamType(AudioManager.STREAM_MUSIC);
        }
        return mp;
    }

}
