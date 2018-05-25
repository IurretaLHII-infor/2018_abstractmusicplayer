package com.example.bortu.abstractmusic;

import android.app.Activity;
import android.content.Intent;
import android.os.Build;
import android.os.Bundle;
import android.support.annotation.RequiresApi;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;
import android.widget.TextView;
import android.widget.Toast;

import org.json.JSONException;

import java.io.IOException;

import Objects.*;


public class AtRegister extends Activity {

    boolean registerPetition = false;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_at_register);

        //Layout objects declaration
        final EditText registerUser = (EditText) findViewById(R.id.registerUser);
        final EditText registerEmail = (EditText) findViewById(R.id.registerEmail);
        final EditText registerPass = (EditText) findViewById(R.id.registerPass);
        final EditText registerPass2 = (EditText) findViewById(R.id.registerPass2);
        Button registerContinue = (Button) findViewById(R.id.registerContinue);
        TextView txtLogin = (TextView) findViewById(R.id.txtLogin);

        //Login Link
        txtLogin.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                Intent iLogin = new Intent(AtRegister.this, AtLogin.class);
                startActivity(iLogin);
                finish();
            }
        });

        //Send register
        registerContinue.setOnClickListener(new View.OnClickListener() {
            @RequiresApi(api = Build.VERSION_CODES.N)
            @Override
            public void onClick(View v) {
                if (Utils.registerCheck(AtRegister.this, registerUser.getText().toString(), registerPass.getText().toString(), registerPass2.getText().toString(), registerEmail.getText().toString())) {

                    registerPetition = APIPost.registerPetition(AtRegister.this, registerUser.getText().toString(), registerPass.getText().toString(), registerEmail.getText().toString());

                    if (registerPetition == true) {
                        Intent iLogin = new Intent(AtRegister.this, AtLogin.class);
                        startActivity(iLogin);
                        finish();
                    }
                }
            }
        });
    }
}
