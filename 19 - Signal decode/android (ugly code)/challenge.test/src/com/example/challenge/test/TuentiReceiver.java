package com.example.challenge.test;

import java.io.ByteArrayInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;

import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import android.graphics.Bitmap;
import android.graphics.BitmapFactory;
import android.os.Bundle;
import android.util.Log;

public class TuentiReceiver extends BroadcastReceiver {
	static int position = 0;
	
    @Override
    public void onReceive(Context arg0, Intent arg1) {
/*
 * 
public class MyPhoneReceiver extends BroadcastReceiver {

  @Override
  public void onReceive(Context context, Intent intent) {
    Bundle extras = intent.getExtras();
    if (extras != null) {
      String state = extras.getString(TelephonyManager.EXTRA_STATE);
      Log.w("MY_DEBUG_TAG", state);
      if (state.equals(TelephonyManager.EXTRA_STATE_RINGING)) {
        String phoneNumber = extras
            .getString(TelephonyManager.EXTRA_INCOMING_NUMBER);
        Log.w("MY_DEBUG_TAG", phoneNumber);
      }
    }
  }
} 
 */
        Log.d("*******", arg1.toString());
        
        //Object obj = arg1.getExtras().get("SIGNAL_INFO");
        //Class cls = obj.getClass();
        byte[] b = arg1.getExtras().getByteArray("SIGNAL_INFO");
        /*
        InputStream is = new ByteArrayInputStream(b);
        
        Bitmap bitmap = BitmapFactory.decodeStream(is);
        if (bitmap != null) {
        	Log.d("**********", "******** TENEMOS IMAGEN");
        }
        else {
        	Log.d("**********", "******** NADAAAAAAAAAAA ");
        }
        */
        
        Log.d("*********************", String.valueOf(b.length));
        //Log.d("*********",  b.toString());
    
        String filename = "/data/data/com.example.challenge.test/tuenti.signal4_" + String.valueOf(position);
        position++;
        /*
        FileOutputStream fos;
        try {
            fos = new FileOutputStream(filename);
            fos.write(b);
            fos.flush();
            fos.close();
        } catch (FileNotFoundException e) {
            Log.d("*************", "ERROR FILE1");
            e.printStackTrace();
        } catch (IOException e) {
            Log.d("*************", "ERROR FILE2");
            e.printStackTrace();
        }
        */
        

    }

}
