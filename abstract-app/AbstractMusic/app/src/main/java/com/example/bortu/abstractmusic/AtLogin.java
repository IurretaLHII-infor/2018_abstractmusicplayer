package com.example.bortu.abstractmusic;

import android.app.Activity;
import android.content.Intent;
import android.content.SharedPreferences;
import android.os.Bundle;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;
import android.widget.TextView;
import android.widget.Toast;

import org.json.JSONArray;
import org.json.JSONException;

import java.io.IOException;
import java.util.ArrayList;

import Objects.*;

public class AtLogin extends Activity {

    //Declarations
    TextView txtRegister;
    EditText loginUser;
    EditText loginPass;
    Button loginContinue;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_at_login);

        //Check if the saved token is valid
        if (Utils.getToken(AtLogin.this) != "") {
            JSONArray loginTry = APIGet.getGenres(AtLogin.this, true);
            int tokenLogin = 0;
            try {
                tokenLogin = loginTry.getJSONObject(0).getInt("responseid");
                if(tokenLogin == 1){
                    Intent iMain = new Intent(AtLogin.this, AtMain.class);
                    startActivity(iMain);
                    finish();
                }
            } catch (JSONException e) {
                Toast.makeText(AtLogin.this, "There was a problem with server response, try again later", Toast.LENGTH_LONG).show();
            }
        }

        //Link layout objects with class objects
        txtRegister = (TextView) findViewById(R.id.txtRegister);
        loginUser = (EditText) findViewById(R.id.loginUser);
        loginPass = (EditText) findViewById(R.id.loginPass);
        loginContinue = (Button) findViewById(R.id.loginContinue);

        //Register Link
        txtRegister.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                Intent iRegister = new Intent(AtLogin.this, AtRegister.class);
                startActivity(iRegister);
                finish();
            }
        });

        //Continue
        loginContinue.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {

                String usr = String.valueOf(loginUser.getText());
                String pass = String.valueOf(loginPass.getText());

                if (Utils.loginCheck(AtLogin.this, usr, pass) == true) {
                    if (APIPost.loginPetition(AtLogin.this, usr, pass) == true) {
                        Intent iMain = new Intent(AtLogin.this, AtMain.class);
                        startActivity(iMain);
                        finish();
                    }
                }
            }
        });
    }
}
