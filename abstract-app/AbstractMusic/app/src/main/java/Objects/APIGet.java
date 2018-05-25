//This class will contain every GET petition

package Objects;

import android.content.Context;
import android.os.StrictMode;
import android.widget.Toast;

import java.io.DataInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.net.MalformedURLException;
import java.net.ProtocolException;
import java.net.URL;
import java.util.ArrayList;

import javax.net.ssl.HttpsURLConnection;

import org.json.*;

public class APIGet {

    //Variables
    private static String httpsURL = "";
    private static HttpsURLConnection con = null;

    //Get Genres
    public static JSONArray getGenres(Context context, boolean login) {

        //Init variables
        JSONArray responseArray = null;

        //Build URL
        httpsURL = "https://abstractmusic.iurretalhi.eus/api.php/genres";

        //Allow usage of some sentences
        strictMode();

        //Open connection
        con = openConnection(context, httpsURL);

        //Set connection properties
        con = setMethod(context, con);

        //Read server response
        responseArray = readResponse(context, con);


        con.disconnect();

        if (responseArray != null) {
            try {
                if (login == true) {
                    JSONArray tokenResponseArray = responseArray.getJSONArray(0);
                    return tokenResponseArray;
                } else {
                    JSONArray genresResponseArray = responseArray.getJSONArray(1);
                    return genresResponseArray;
                }

            } catch (JSONException e) {
                Toast.makeText(context, "There was a problem with server response, try again later", Toast.LENGTH_LONG).show();
            }
        }

        return responseArray;
    }

    //Get subgenres by genre
    public static JSONArray getListObjects(Context context, int petition, int object){
        //Init variables
        JSONArray responseArray = null;

        //Build URL
        httpsURL = "https://abstractmusic.iurretalhi.eus/api.php/";

        switch(petition) {
            case 0:
                httpsURL = httpsURL + "subgenresbygenre/";
                break;
            case 1:
                httpsURL = httpsURL + "artistsbygenre/";
                break;
            case 2:
                httpsURL = httpsURL + "albumsbysubgenre/";
                break;
            case 3:
                httpsURL = httpsURL + "albumsbyartist/";
                break;
            case 4:
                httpsURL = httpsURL + "songsbyalbum/";
                break;
        }
        httpsURL = httpsURL + Integer.toString(object);

        //Allow usage of some sentences
        strictMode();

        //Open connection
        con = openConnection(context, httpsURL);

        //Set connection properties
        con = setMethod(context, con);

        //Read server response
        responseArray = readResponse(context, con);

        if (responseArray != null) {
            try {
                if(responseArray.getJSONArray(0).getJSONObject(0).getInt("responseid") != 1){
                    responseArray = null;
                }
                else{
                    responseArray = responseArray.getJSONArray(1);
                }
            } catch (JSONException e) {
                e.printStackTrace();
            }
        }
        return responseArray;
        }

    //Get song information
    public static ArrayList<String> getSongInfo(Context context, int curSong) throws IOException {

        //Init variables
        JSONArray responseArray = null;
        JSONObject songInformation = null;
        ArrayList<String> songInfo = null;

        //Build URL
        httpsURL = "https://abstractmusic.iurretalhi.eus/api.php/songinformation/" + curSong;

        //Allow usage of some sentences
        strictMode();

        //Open connection
        con = openConnection(context, httpsURL);

        //Set connection properties
        con = setMethod(context, con);

        //Read server response
        responseArray = readResponse(context, con);

        con.disconnect();

        //Parse response
        if (responseArray != null) {
            try {
                songInformation = responseArray.getJSONObject(0);
                songInfo = new ArrayList<String>();
                songInfo.add(songInformation.getString("artist"));
                songInfo.add(songInformation.getString("album"));
                songInfo.add(songInformation.getString("song"));
            } catch (JSONException e) {
                Toast.makeText(context, "Unexpected server response, try again later", Toast.LENGTH_LONG).show();
            }
        }

        //Return song information
        return songInfo;

    }

    //Allow usage of some sentences
    private static void strictMode() {
        StrictMode.ThreadPolicy policy = new StrictMode.ThreadPolicy.Builder().permitAll().build();
        StrictMode.setThreadPolicy(policy);
    }

    //Build connection
    private static HttpsURLConnection openConnection(Context context, String url) {
        URL myurl = null;
        HttpsURLConnection con = null;
        try {
            myurl = new URL(url);
            con = (HttpsURLConnection) myurl.openConnection();
        } catch (MalformedURLException e) {
            Toast.makeText(context, "Unexpected error, try again later", Toast.LENGTH_SHORT).show();
        } catch (IOException e) {
            Toast.makeText(context, "Unexpected error, try again later", Toast.LENGTH_SHORT).show();
        }

        return con;
    }

    //Set connection properties
    private static HttpsURLConnection setMethod(Context context, HttpsURLConnection con) {

        try {
            con.setRequestMethod("GET");
            con.setRequestProperty("Authorization", Utils.getToken(context));
            con.setDoInput(true);
            con.setRequestProperty("User-Agent", "AbstractMusicApp");

        } catch (ProtocolException e) {
            e.printStackTrace();
        }

        return con;

    }

    //Read server response
    private static JSONArray readResponse(Context context, HttpsURLConnection con) {

        //Init variables
        JSONArray responseArray = null;
        String response = "";
        InputStream input = null;

        //Read response
        try {

            input = con.getInputStream();

            for (int c = input.read(); c != -1; c = input.read()) {
                response = response + Character.toString((char) c);
            }

            if (response != "") {
                responseArray = new JSONArray(response);
            }

            input.close();
        } catch (IOException e) {
            Toast.makeText(context, "There was a problem reading server response, try again later", Toast.LENGTH_LONG).show();
        } catch (JSONException e) {
            Toast.makeText(context, "Unexpected server response, try again later", Toast.LENGTH_LONG).show();
        }

        //Return response
        return responseArray;
    }

}
