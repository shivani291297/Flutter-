package com.avis.ltscall_flutter_app;

import android.Manifest;
import android.content.pm.PackageManager;
import android.os.Bundle;
import android.content.*;
import android.support.annotation.NonNull;
import android.support.v4.app.ActivityCompat;
import android.support.v4.content.ContextCompat;
import android.telephony.*;
import android.net.*;
import android.widget.Toast;

import io.flutter.app.FlutterActivity;
import io.flutter.plugin.common.*;
import io.flutter.plugins.GeneratedPluginRegistrant;

public class MainActivity extends FlutterActivity {
    private static final String CHANNEL = "MyNativeChannel";

    String text;
    String getStatus = "free";
    protected void onCreate(Bundle savedInstanceState) {

        super.onCreate(savedInstanceState);
        GeneratedPluginRegistrant.registerWith(this);

        if(ContextCompat.checkSelfPermission(MainActivity.this, Manifest.permission.CALL_PHONE)!= PackageManager.PERMISSION_GRANTED){
            ActivityCompat.requestPermissions(MainActivity.this,new String[]{
                    Manifest.permission.CALL_PHONE
            },
                    1);
        }
        else{

        }

        new MethodChannel(getFlutterView(), CHANNEL).setMethodCallHandler(
                new MethodChannel.MethodCallHandler() {
                    @Override
                    public void onMethodCall(MethodCall call, MethodChannel.Result result) {
                        if (call.method.equals("getData")) {
                            text = call.argument("number");
                            getData();
                        }
                    }
                });
    }

    @Override
    public void onRequestPermissionsResult(int requestCode, @NonNull String[] permissions, @NonNull int[] grantResults) {
        super.onRequestPermissionsResult(requestCode, permissions, grantResults);
        if(requestCode==1){
            if(permissions[0].length()>0&& permissions[0]==Manifest.permission.CALL_PHONE){
                getData();
            }

        }
    }

    private void getData() {
        String number=text;
        Intent callIntent = new Intent(Intent.ACTION_CALL);
        callIntent.setData(Uri.parse("tel:"+number));
        startActivity(callIntent);

    }
}

