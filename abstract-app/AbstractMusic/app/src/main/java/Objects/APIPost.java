//This class will contain every POST petition

package Objects;

import android.content.Context;
import android.os.StrictMode;
import android.widget.Toast;

import java.io.DataInputStream;
import java.io.DataOutputStream;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.MalformedURLException;
import java.net.ProtocolException;
import java.net.URL;
import java.net.URLEncoder;

import javax.net.ssl.HttpsURLConnection;

import org.json.*;

public class APIPost {

    //Init variables
    private static String httpsURL = "";
    private static String query = "";
    private static HttpsURLConnection con = null;
    private static JSONArray responseArray = null;

    public static boolean registerPetition(Context context, String user, String password, String email) {

        //Variables
        JSONObject registerResponse = null;
        boolean success = false;

        //URL and body build
        httpsURL = "https://abstractmusic.iurretalhi.eus/api.php/registeruser";

        //Allow usage of some sentences
        strictMode();

        try {
            query = "username=" + URLEncoder.encode(user, "UTF-8");
            query += "&";
            query += "password=" + URLEncoder.encode(password, "UTF-8");
            query += "&";
            query += "email=" + URLEncoder.encode(email, "UTF-8");

            //Open connection
            con = openConnection(context, httpsURL);

            //Set request method and properties
            con = setMethod(context, con, query);

            //Write parameters
            writeParameters(context, con, query);

            //Read response
            responseArray = readResponse(context, con);
            if(responseArray != null){
                try {
                    registerResponse = responseArray.getJSONObject(0);
                    if (registerResponse.getInt("responseid") == 1) {
                        success = true;
                    } else {
                        success = false;
                    }

                    Toast.makeText(context, registerResponse.getString("description"), Toast.LENGTH_LONG).show();
                } catch (JSONException e) {
                    Toast.makeText(context, "There was an error reading server response, try again later", Toast.LENGTH_LONG).show();
                    success = false;
                }
            }
            else{
                Toast.makeText(context, "There was a problem with server response, try again later", Toast.LENGTH_LONG).show();
            }

            //disconnect
            con.disconnect();


        } catch (UnsupportedEncodingException e) {
            Toast.makeText(context, "There was an error about user data, try again later", Toast.LENGTH_LONG).show();
            success = false;
        }

        //Return if the function has succeded
        return success;
    }

    //Login Petition
    public static boolean loginPetition(Context context, String user, String password) {

        //Variables
        JSONObject loginResponse = null;
        boolean success = false;

        //Allow usage of some sentences
        strictMode();

        //URL and body build
        httpsURL = "https://abstractmusic.iurretalhi.eus/api.php/login";
        try {
            query = "username=" + URLEncoder.encode(user, "UTF-8");
            query += "&";
            query += "password=" + URLEncoder.encode(password, "UTF-8");

            //Build connection
            con = openConnection(context, httpsURL);

            //Set connection properties
            con = setMethod(context, con, query);


            //Write petition parameters
            writeParameters(context, con, query);

            //Read response
            responseArray = readResponse(context, con);

            //Parse response
            if(responseArray != null){
                try {
                    loginResponse = responseArray.getJSONObject(0);
                } catch (JSONException e) {
                    e.printStackTrace();
                }

                if (loginResponse.getInt("responseid") == 1 ) {
                    Utils.saveToken(context, loginResponse.getString("token"));
                    success = true;
                } else {
                    Toast.makeText(context, loginResponse.getString("description"), Toast.LENGTH_LONG).show();
                    success = false;
                }
            }
            else{
                Toast.makeText(context, "There was a problem with server response, try again later", Toast.LENGTH_LONG).show();
            }

            //Disconnect
            con.disconnect();
        } catch (UnsupportedEncodingException e) {
            Toast.makeText(context, "There was a problem with users data, try again later", Toast.LENGTH_LONG).show();
        } catch (JSONException e) {
            Toast.makeText(context, "There was a problem reading servers response, try again later", Toast.LENGTH_LONG).show();
        }

        //Return if the function has succeded
        return success;
    }

    //Allow usage of some sentences
    private static void strictMode() {
        StrictMode.ThreadPolicy policy = new StrictMode.ThreadPolicy.Builder().permitAll().build();
        StrictMode.setThreadPolicy(policy);
    }

    //Connection
    private static HttpsURLConnection openConnection(Context context, String url) {

        //Init variables
        URL myurl = null;
        HttpsURLConnection con = null;
        //Build connection
        try {
            myurl = new URL(url);
            con = (HttpsURLConnection) myurl.openConnection();
            //con.connect();
            return con;
        } catch (MalformedURLException e) {
            Toast.makeText(context, "Can't connect to server, try again later", Toast.LENGTH_LONG).show();
        } catch (IOException e) {
            Toast.makeText(context, "Can't connect to server, try again later", Toast.LENGTH_LONG).show();
        }
        return con;
    }

    //Connection propeties
    private static HttpsURLConnection setMethod(Context context, HttpsURLConnection con, String query) {
        try {

            con.setRequestMethod("POST");
            con.setRequestProperty("User-Agent", "AbstractMusicApp");
            con.setDoOutput(true);
            con.setDoInput(true);

        } catch (ProtocolException e) {
            Toast.makeText(context, "Error when loading connection properties, try again later", Toast.LENGTH_LONG).show();
        } catch (IOException e) {
            e.printStackTrace();
        }
        return con;
    }

    //Write petition parameters
    private static void writeParameters(Context context, HttpsURLConnection con, String query) {
        DataOutputStream output = null;
        try {
            output = new DataOutputStream(con.getOutputStream());
            output.writeBytes(query);
            output.close();
        } catch (IOException e) {
            Toast.makeText(context, "Error sending petition, try again later", Toast.LENGTH_LONG).show();
        }
    }

    //Read server response
    private static JSONArray readResponse(Context context, HttpsURLConnection con) {
        JSONArray responseArray = null;
        String response = "";
        DataInputStream input = null;

        try {
            input = new DataInputStream(con.getInputStream());
            for (int c = input.read(); c != -1; c = input.read()) {
                response = response + Character.toString((char) c);
            }

            if (response != "") {
                responseArray = new JSONArray(response);
            }
            input.close();
        } catch (IOException e) {
            Toast.makeText(context, "Error reading server message, try again later", Toast.LENGTH_LONG).show();
        } catch (JSONException e) {
            Toast.makeText(context, "Unexpected server response, try again later", Toast.LENGTH_LONG).show();
        }

        return responseArray;
    }
}
