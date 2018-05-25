package Objects;

import android.content.Context;
import android.content.Intent;
import android.content.SharedPreferences;
import android.media.MediaPlayer;
import android.net.Uri;
import android.os.StrictMode;
import android.widget.Toast;

import java.io.DataInputStream;
import java.io.DataOutputStream;
import java.io.IOException;
import java.net.URL;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.Random;
import java.util.Set;

import javax.net.ssl.HttpsURLConnection;

import static android.content.Context.MODE_PRIVATE;

public class Utils {

    //Login check
    public static boolean loginCheck(Context context, String usr, String pass) {
        //User check
        if (userCheck(context, usr) == false) {
            return false;
        }
        //Password check
        if (passwordCheck(context, pass) == false) {
            return false;
        }
        return true;
    }

    //Register Check
    public static boolean registerCheck(Context context, String usr, String pass, String pass2, String email) {
        //User check
        if (userCheck(context, usr) == false) {
            return false;
        }

        //Pass check
        if (passwordCheck(context, pass) == false) {
            return false;
        }
        //Check if passwords are written identically
        if (repeatPassword(context, pass, pass2) == false) {
            return false;
        }
        //Check email
        if (emailCheck(context, email) == false) {
            return false;
        }

        return true;

    }

    //User check
    private static boolean userCheck(Context context, String user) {
        //Username must be between 3 and 25 characters
        if (user.length() > 25 || user.length() < 3) {
            Toast.makeText(context, "Invalid username lenght, it must be betwen 1-25 characters", Toast.LENGTH_LONG).show();
            return false;
        } else {
            //Username can't have specific special characters
            for (int i = 0; i < user.length(); i++) {
                if (user.charAt(i) == ' ' || user.charAt(i) == '"' || user.charAt(i) == (char) 39 || user.charAt(i) == ';' || user.charAt(i) == '=') {
                    Toast.makeText(context, "Invalid username, you can't use characters like [' ', '" + Character.toString((char) 34) + "', ';', '=']", Toast.LENGTH_LONG).show();
                    return false;
                }
            }
        }
        return true;
    }

    //Pass check
    private static boolean passwordCheck(Context context, String pass) {
        //Password must be between 8 and 25 characters long
        if (pass.length() < 8 || pass.length() > 25) {
            Toast.makeText(context, "Invalid password lenght, it must be betwen 1-25 characters", Toast.LENGTH_LONG).show();
            return false;
        } else {
            //Password can't contain specific special characters
            for (int i = 0; i < pass.length(); i++) {
                if (pass.charAt(i) == ' ' || pass.charAt(i) == '"' || pass.charAt(i) == (char) 39 || pass.charAt(i) == ';' || pass.charAt(i) == '=') {
                    Toast.makeText(context, "Invalid password, you can't use characters like [' ', '" + Character.toString((char) 34) + "', ';', '=']", Toast.LENGTH_LONG).show();
                    return false;
                }
            }
        }
        return true;
    }

    //Check if passwords are written identically
    private static boolean repeatPassword(Context context, String pass, String pass2) {
        //Second password must be the same as first password
        if (pass.compareTo(pass2) != 0) {
            Toast.makeText(context, "Passwords don't match", Toast.LENGTH_LONG).show();
            return false;
        }
        return true;
    }

    //Check email
    private static boolean emailCheck(Context context, String email) {
        //Email must have this format '????@*.*'
        for (int i = 0; i < email.length(); i++) {
            if (email.charAt(i) == '@') {
                if (i == 0 || (email.length() - i) < 4) {
                    Toast.makeText(context, "Email format is not valid. Try 'something@somewhere.somehow'", Toast.LENGTH_SHORT).show();
                    return false;
                }
            }
            //KUNGFU.Comprobacion de emails validos en DB
        }
        return true;
    }

    //Save token of the actual user on SharedPreferences
    public static void saveToken(Context context, String token) {
        SharedPreferences pref = context.getApplicationContext().getSharedPreferences("myPref", MODE_PRIVATE);
        SharedPreferences.Editor editor = pref.edit();
        editor.putString("token", token);
        editor.apply();

    }

    //Get the actual saved token of the last user that logged in and didnt log out
    public static String getToken(Context context) {
        //Get saved token
        SharedPreferences pref = context.getApplicationContext().getSharedPreferences("myPref", MODE_PRIVATE);
        return pref.getString("token", "");
    }

    //Go to previous song
    public static void previousSong(Context context, MediaPlayer mp) {
        //Get current song
        ArrayList<Integer> playlist = getCurrentPlaylist(context);
        int curSong = getCurrentSong(context);
        int curSongPosInPlaylist = getCurSongPosInPlaylist(context);

        //If shuffle is activated, get a random song of the playlist
        boolean shuffle = getShuffle(context);
        if (shuffle == true) {
            Random r = new Random();
            curSong = playlist.get(r.nextInt(playlist.size() - 1));
        } else {
            if (curSongPosInPlaylist == 0) {
                curSong = playlist.get(playlist.size() - 1);
            } else {
                curSong = playlist.get(curSongPosInPlaylist - 1);
            }
        }
        //Save new song
        saveCurrentSong(context, curSong);

    }

    //Go to next song
    public static void nextSong(Context context, MediaPlayer mp) {

        //Get current song
        ArrayList<Integer> playlist = getCurrentPlaylist(context);
        int curSong = getCurrentSong(context);
        int curSongPosInPlaylist = getCurSongPosInPlaylist(context);
        boolean shuffle = getShuffle(context);
        boolean repeat = getRepeat(context);
        boolean play = false;

        //If shuffle is activated, get a random song
        if (shuffle == true) {

            Random r = new Random();
            curSong = playlist.get(r.nextInt(playlist.size()));
            play = true;
        } else {
            if(curSongPosInPlaylist == playlist.size() - 1){
                if(repeat == true){
                    curSong = playlist.get(0);
                    play = true;
                }
                else{
                    curSong = playlist.get(0);
                    play = false;
                }
            }
            else{
                curSong = playlist.get(curSongPosInPlaylist + 1);
                play = true;
            }
        }

        //Save new song
        saveCurrentSong(context, curSong);
        if(play == true){
            playCurrentSong(context, mp);
        }
    }

    //Save the current song
    public static void saveCurrentSong(Context context, int song) {
        SharedPreferences pref = context.getApplicationContext().getSharedPreferences("myPref", MODE_PRIVATE);
        SharedPreferences.Editor editor = pref.edit();
        editor.putInt("curSong", song);
        editor.apply();

    }

    //Save the current playlist
    public static void updatePlaylist(Context context, ArrayList<Integer> playlist) {
        SharedPreferences pref = context.getApplicationContext().getSharedPreferences("myPref", MODE_PRIVATE);
        SharedPreferences.Editor editor = pref.edit();

        //Convert playlist Array to set
        Set<String> set = new HashSet<String>();
        for (int i = 0; i < playlist.size(); i++) {
            set.add(playlist.get(i).toString());
        }
        editor.putStringSet("playlist", set);
        saveCurrentSong(context, playlist.get(0));
        editor.apply();
    }

    //Play current song
    public static boolean playCurrentSong(Context context, MediaPlayer mp) {
        int curSong = getCurrentSong(context);
        if (curSong == 0) {
            Toast.makeText(context, "No song is loaded, try searching for one", Toast.LENGTH_LONG).show();
            return false;
        } else {

            //If mp is playing, stop it
            if (mp.isPlaying()) {
                mp.stop();

            }
            mp.reset();
            String curSongPath = "https://abstractmusic.iurretalhi.eus/api.php/playsong/" + curSong;
            Uri uri = Uri.parse(curSongPath);


            try {
                mp.setDataSource(context, uri);
                mp.prepare();
                mp.start();
            } catch (IOException e) {
                Toast.makeText(context, "Could not play song right now, try again later", Toast.LENGTH_LONG).show();
                return false;
            }
            return true;


        }

    }

    //Get current song
    public static int getCurrentSong(Context context) {
        int curSong;
        SharedPreferences pref = context.getApplicationContext().getSharedPreferences("myPref", MODE_PRIVATE);
        return pref.getInt("curSong", 0);
    }

    //Get current playlist
    public static ArrayList<Integer> getCurrentPlaylist(Context context) {

        ArrayList<Integer> playlist = new ArrayList<Integer>();

        SharedPreferences pref = context.getApplicationContext().getSharedPreferences("myPref", MODE_PRIVATE);
        Set<String> set = pref.getStringSet("playlist", null);
        for (String myVal : set) {
            playlist.add(Integer.parseInt(myVal));
        }
        return playlist;
    }

    //Get position of the current song in the saved playlist
    public static int getCurSongPosInPlaylist(Context context) {
        SharedPreferences pref = context.getSharedPreferences("myPref", MODE_PRIVATE);
        int curSong = getCurrentSong(context);
        ArrayList<Integer> playlist = getCurrentPlaylist(context);
        for (int i = 0; i < playlist.size(); i++) {
            if (curSong == playlist.get(i)) {
                return i;
            }
        }
        return 0;
    }

    //Get shuffle state
    public static boolean getShuffle(Context context) {
        SharedPreferences pref = context.getApplicationContext().getSharedPreferences("myPref", MODE_PRIVATE);
        return pref.getBoolean("shuffle", false);
    }

    //Get repeat state
    public static boolean getRepeat(Context context) {
        SharedPreferences pref = context.getApplicationContext().getSharedPreferences("myPref", MODE_PRIVATE);
        return pref.getBoolean("repeat", false);
    }

    //Empty SharedPreferences values
    public static void logout(Context context) {
        SharedPreferences pref = context.getSharedPreferences("myPref", MODE_PRIVATE);
        SharedPreferences.Editor editor = pref.edit();
        editor.putString("token", "");
        editor.putStringSet("playlist", null);
        editor.putInt("curSong", 0);
        editor.apply();
    }

}