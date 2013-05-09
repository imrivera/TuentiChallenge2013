package com.example.challenge.test;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.net.URI;

import android.net.Uri;
import android.os.Bundle;
import android.os.RemoteException;
import android.app.Activity;
import android.content.ContentProviderClient;
import android.content.ContentResolver;
import android.database.Cursor;
import android.util.Log;
import android.view.Menu;

public class MainActivity extends Activity {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

 
        
        
        Log.d("MyReceiver", "1");

        ContentResolver cp = getContentResolver();
           // "com.tuenti.lostchallenge.datamodel.provider.ContestProvider");
        Log.d("MyReceiver", "AQUI");
        Uri uri = Uri.parse("content://com.tuenti.lostchallenge.datamodel.provider.ContestProvider/contest");
        String[] projection = new String[]{"value"};
        String selection = "key=?";
        
        String[] selectionArgs = new String[]{"2316"};
        Log.d("*****", "ANTEEEEEEEEES");
          Cursor cursor = cp.query(uri, projection, selection, selectionArgs, null);
          cursor.moveToFirst();
          Log.d("MyReceiver", "Got cursor with count: " + cursor.getCount());
          Log.d("MyReceiver", "Result: " + cursor.getColumnIndex("value"));
          Log.d("MyReceiver", "Result: " + cursor.getString(0));
          Log.d("**********", "************************************************");

	
            
    }

    @Override
    public boolean onCreateOptionsMenu(Menu menu) {
        // Inflate the menu; this adds items to the action bar if it is present.
        getMenuInflater().inflate(R.menu.main, menu);
        return true;
    }

}
