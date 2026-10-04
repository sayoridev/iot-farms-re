package com.keyestudio.IOTfarm;

import android.content.SharedPreferences;
import android.os.Bundle;
import android.preference.PreferenceManager;
import android.util.Log;
import android.view.MotionEvent;
import android.view.View;
import android.widget.Button;
import android.widget.CompoundButton;
import android.widget.EditText;
import android.widget.Switch;
import android.widget.TextView;
import android.widget.Toast;
import androidx.appcompat.app.ActionBar;
import androidx.appcompat.app.AppCompatActivity;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.net.Socket;
import java.net.UnknownHostException;

/* JADX INFO: loaded from: classes.dex */
public class MainActivity extends AppCompatActivity {
    TextView Humidity;
    TextView Light;
    TextView Rainwater;
    TextView Soil_Humidity;
    TextView Temperature;
    TextView Water_Level;
    Switch connect;
    private EditText ip;
    connectthread lianjie;
    TextView receive;
    String a = "192.168.3.2";
    int b = 80;
    Boolean disconnectVal = false;
    Socket socket = null;
    String text1 = "";
    int led_flag = 1;
    int music_flag = 1;
    int fan_flag = 1;
    int watering_flag = 1;
    int servo_flag = 1;
    String[] strs = {"℃", "%"};
    int[] intData = new int[6];

    @Override // androidx.fragment.app.FragmentActivity, androidx.activity.ComponentActivity, androidx.core.app.ComponentActivity, android.app.Activity
    protected void onCreate(Bundle bundle) {
        super.onCreate(bundle);
        setContentView(R.layout.activity_main2);
        ActionBar supportActionBar = getSupportActionBar();
        if (supportActionBar != null) {
            supportActionBar.hide();
        }
        getWindow().addFlags(128);
        this.ip = (EditText) findViewById(R.id.mEtIP);
        this.receive = (TextView) findViewById(R.id.receive);
        this.Temperature = (TextView) findViewById(R.id.temp);
        this.Humidity = (TextView) findViewById(R.id.HB);
        this.Soil_Humidity = (TextView) findViewById(R.id.S_HB);
        this.Water_Level = (TextView) findViewById(R.id.W_L);
        this.Light = (TextView) findViewById(R.id.Lig);
        this.Rainwater = (TextView) findViewById(R.id.Rai);
        this.connect = (Switch) findViewById(R.id.connect_button);
        Button button = (Button) findViewById(R.id.led_button);
        Button button2 = (Button) findViewById(R.id.servo_button);
        Button button3 = (Button) findViewById(R.id.music_button);
        Button button4 = (Button) findViewById(R.id.fan_button);
        Button button5 = (Button) findViewById(R.id.watering_button);
        outData();
        this.connect.setOnCheckedChangeListener(new CompoundButton.OnCheckedChangeListener() { // from class: com.keyestudio.IOTfarm.MainActivity.1
            @Override // android.widget.CompoundButton.OnCheckedChangeListener
            public void onCheckedChanged(CompoundButton compoundButton, boolean z) {
                MainActivity mainActivity = MainActivity.this;
                mainActivity.a = mainActivity.ip.getText().toString();
                if (z) {
                    MainActivity.this.b = Integer.parseInt("80");
                    MainActivity.this.lianjie = MainActivity.this.new connectthread();
                    MainActivity.this.lianjie.start();
                    MainActivity.this.autoSaveData();
                    return;
                }
                new Thread(new Runnable() { // from class: com.keyestudio.IOTfarm.MainActivity.1.1
                    @Override // java.lang.Runnable
                    public void run() {
                        try {
                            if (MainActivity.this.disconnectVal.booleanValue()) {
                                MainActivity.this.socket.close();
                                MainActivity.this.socket = null;
                                MainActivity.this.disconnectVal = false;
                            }
                        } catch (IOException e) {
                            throw new RuntimeException(e);
                        }
                    }
                }).start();
                Toast.makeText(MainActivity.this, "Please enter IP", 0).show();
                MainActivity.this.receive.setText("");
                MainActivity.this.receive.append("Connection closed");
            }
        });
        button.setOnTouchListener(new AnonymousClass2());
        button3.setOnTouchListener(new AnonymousClass3());
        button2.setOnTouchListener(new AnonymousClass4());
        button4.setOnTouchListener(new AnonymousClass5());
        button5.setOnTouchListener(new AnonymousClass6());
    }

    /* JADX INFO: renamed from: com.keyestudio.IOTfarm.MainActivity$2, reason: invalid class name */
    class AnonymousClass2 implements View.OnTouchListener {
        AnonymousClass2() {
        }

        @Override // android.view.View.OnTouchListener
        public boolean onTouch(View view, final MotionEvent motionEvent) {
            new Thread(new Runnable() { // from class: com.keyestudio.IOTfarm.MainActivity.2.1
                @Override // java.lang.Runnable
                public void run() {
                    if (MainActivity.this.socket != null) {
                        if (motionEvent.getAction() == 0) {
                            try {
                                if (MainActivity.this.led_flag == 1) {
                                    MainActivity.this.lianjie.outputStream.write("as".getBytes());
                                    MainActivity.this.led_flag = 0;
                                    MainActivity.this.findViewById(R.id.led_button).getBackground().setAlpha(100);
                                } else {
                                    MainActivity.this.lianjie.outputStream.write("As".getBytes());
                                    MainActivity.this.led_flag = 1;
                                    MainActivity.this.findViewById(R.id.led_button).getBackground().setAlpha(255);
                                }
                                Thread.sleep(500L);
                                return;
                            } catch (IOException | InterruptedException e) {
                                throw new RuntimeException(e);
                            }
                        }
                        return;
                    }
                    MainActivity.this.runOnUiThread(new Runnable() { // from class: com.keyestudio.IOTfarm.MainActivity.2.1.1
                        @Override // java.lang.Runnable
                        public void run() {
                            Toast.makeText(MainActivity.this, "Please establish a connection first", 0).show();
                        }
                    });
                }
            }).start();
            return false;
        }
    }

    /* JADX INFO: renamed from: com.keyestudio.IOTfarm.MainActivity$3, reason: invalid class name */
    class AnonymousClass3 implements View.OnTouchListener {
        AnonymousClass3() {
        }

        @Override // android.view.View.OnTouchListener
        public boolean onTouch(View view, final MotionEvent motionEvent) {
            new Thread(new Runnable() { // from class: com.keyestudio.IOTfarm.MainActivity.3.1
                @Override // java.lang.Runnable
                public void run() {
                    if (MainActivity.this.socket != null) {
                        if (motionEvent.getAction() == 0) {
                            try {
                                MainActivity.this.lianjie.outputStream.write("es".getBytes());
                                MainActivity.this.findViewById(R.id.music_button).getBackground().setAlpha(100);
                                Thread.sleep(500L);
                            } catch (IOException | InterruptedException e) {
                                throw new RuntimeException(e);
                            }
                        }
                        MainActivity.this.findViewById(R.id.music_button).getBackground().setAlpha(255);
                        return;
                    }
                    MainActivity.this.runOnUiThread(new Runnable() { // from class: com.keyestudio.IOTfarm.MainActivity.3.1.1
                        @Override // java.lang.Runnable
                        public void run() {
                            Toast.makeText(MainActivity.this, "Please establish a connection first", 0).show();
                        }
                    });
                }
            }).start();
            return false;
        }
    }

    /* JADX INFO: renamed from: com.keyestudio.IOTfarm.MainActivity$4, reason: invalid class name */
    class AnonymousClass4 implements View.OnTouchListener {
        AnonymousClass4() {
        }

        @Override // android.view.View.OnTouchListener
        public boolean onTouch(View view, final MotionEvent motionEvent) {
            new Thread(new Runnable() { // from class: com.keyestudio.IOTfarm.MainActivity.4.1
                @Override // java.lang.Runnable
                public void run() {
                    if (MainActivity.this.socket != null) {
                        if (motionEvent.getAction() == 0) {
                            try {
                                if (MainActivity.this.servo_flag == 1) {
                                    MainActivity.this.lianjie.outputStream.write("ds".getBytes());
                                    MainActivity.this.servo_flag = 0;
                                    MainActivity.this.findViewById(R.id.servo_button).getBackground().setAlpha(100);
                                } else {
                                    MainActivity.this.lianjie.outputStream.write("Ds".getBytes());
                                    MainActivity.this.servo_flag = 1;
                                    MainActivity.this.findViewById(R.id.servo_button).getBackground().setAlpha(255);
                                }
                                Thread.sleep(500L);
                                return;
                            } catch (IOException | InterruptedException e) {
                                throw new RuntimeException(e);
                            }
                        }
                        return;
                    }
                    MainActivity.this.runOnUiThread(new Runnable() { // from class: com.keyestudio.IOTfarm.MainActivity.4.1.1
                        @Override // java.lang.Runnable
                        public void run() {
                            Toast.makeText(MainActivity.this, "Please establish a connection first", 0).show();
                        }
                    });
                }
            }).start();
            return false;
        }
    }

    /* JADX INFO: renamed from: com.keyestudio.IOTfarm.MainActivity$5, reason: invalid class name */
    class AnonymousClass5 implements View.OnTouchListener {
        AnonymousClass5() {
        }

        @Override // android.view.View.OnTouchListener
        public boolean onTouch(View view, final MotionEvent motionEvent) {
            new Thread(new Runnable() { // from class: com.keyestudio.IOTfarm.MainActivity.5.1
                @Override // java.lang.Runnable
                public void run() {
                    if (MainActivity.this.socket != null) {
                        if (motionEvent.getAction() == 0) {
                            try {
                                if (MainActivity.this.fan_flag == 1) {
                                    MainActivity.this.lianjie.outputStream.write("cs".getBytes());
                                    MainActivity.this.findViewById(R.id.fan_button).getBackground().setAlpha(100);
                                    MainActivity.this.fan_flag = 0;
                                } else {
                                    MainActivity.this.lianjie.outputStream.write("Cs".getBytes());
                                    MainActivity.this.fan_flag = 1;
                                    MainActivity.this.findViewById(R.id.fan_button).getBackground().setAlpha(255);
                                }
                                Thread.sleep(500L);
                                return;
                            } catch (IOException | InterruptedException e) {
                                throw new RuntimeException(e);
                            }
                        }
                        return;
                    }
                    MainActivity.this.runOnUiThread(new Runnable() { // from class: com.keyestudio.IOTfarm.MainActivity.5.1.1
                        @Override // java.lang.Runnable
                        public void run() {
                            Toast.makeText(MainActivity.this, "Please establish a connection first", 0).show();
                        }
                    });
                }
            }).start();
            return false;
        }
    }

    /* JADX INFO: renamed from: com.keyestudio.IOTfarm.MainActivity$6, reason: invalid class name */
    class AnonymousClass6 implements View.OnTouchListener {
        AnonymousClass6() {
        }

        @Override // android.view.View.OnTouchListener
        public boolean onTouch(View view, final MotionEvent motionEvent) {
            new Thread(new Runnable() { // from class: com.keyestudio.IOTfarm.MainActivity.6.1
                @Override // java.lang.Runnable
                public void run() {
                    if (MainActivity.this.socket != null) {
                        if (motionEvent.getAction() == 0) {
                            try {
                                MainActivity.this.lianjie.outputStream.write("bs".getBytes());
                                MainActivity.this.findViewById(R.id.watering_button).getBackground().setAlpha(100);
                                Thread.sleep(500L);
                            } catch (IOException | InterruptedException e) {
                                throw new RuntimeException(e);
                            }
                        }
                        MainActivity.this.findViewById(R.id.watering_button).getBackground().setAlpha(255);
                        return;
                    }
                    MainActivity.this.runOnUiThread(new Runnable() { // from class: com.keyestudio.IOTfarm.MainActivity.6.1.1
                        @Override // java.lang.Runnable
                        public void run() {
                            Toast.makeText(MainActivity.this, "Please establish a connection first", 0).show();
                        }
                    });
                }
            }).start();
            return false;
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void autoSaveData() {
        this.text1 = this.ip.getText().toString();
        SharedPreferences.Editor editorEdit = PreferenceManager.getDefaultSharedPreferences(this).edit();
        editorEdit.putString("text1", this.text1);
        editorEdit.apply();
        Toast.makeText(this, "IP saved!", 0).show();
    }

    private void outData() {
        String string = PreferenceManager.getDefaultSharedPreferences(this).getString("text1", "");
        if (string == "") {
            string = "192.168.3.2";
        }
        this.ip.setText(string);
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void dataHandle(String str) {
        int length = str.length();
        int i = (length / 2) + (length % 2);
        String[] strArr = new String[i];
        for (int i2 = 0; i2 < length; i2 += 2) {
            if (i2 == length - 1) {
                strArr[i2 / 2] = str.substring(i2);
            } else {
                strArr[i2 / 2] = str.substring(i2, i2 + 2);
            }
        }
        int[] iArr = new int[i];
        for (int i3 = 0; i3 < i; i3++) {
            iArr[i3] = Integer.parseInt(strArr[i3], 16);
        }
        int[] iArr2 = new int[6];
        if (iArr[0] == 0) {
            iArr2[0] = 0;
            iArr2[1] = 0;
            iArr2[2] = iArr[1];
            iArr2[3] = iArr[2];
            iArr2[4] = iArr[3];
            iArr2[5] = iArr[4];
        }
        Log.i("数组长度", ":" + i);
        if (i == 6) {
            this.intData = iArr;
        } else {
            this.intData = iArr2;
        }
    }

    class connectthread extends Thread {
        OutputStream outputStream = null;
        InputStream inputStream = null;

        connectthread() {
        }

        @Override // java.lang.Thread, java.lang.Runnable
        public void run() {
            try {
                MainActivity.this.socket = new Socket(MainActivity.this.a, MainActivity.this.b);
                MainActivity.this.runOnUiThread(new Runnable() { // from class: com.keyestudio.IOTfarm.MainActivity.connectthread.1
                    @Override // java.lang.Runnable
                    public void run() {
                        Toast.makeText(MainActivity.this, "Successfully Connected", 0).show();
                        MainActivity.this.receive.setText("");
                        MainActivity.this.receive.append("Connection ready");
                        MainActivity.this.disconnectVal = true;
                    }
                });
            } catch (UnknownHostException e) {
                MainActivity.this.runOnUiThread(new Runnable() { // from class: com.keyestudio.IOTfarm.MainActivity.connectthread.2
                    @Override // java.lang.Runnable
                    public void run() {
                        Toast.makeText(MainActivity.this, "Connect Failed", 0).show();
                        MainActivity.this.receive.setText("");
                        MainActivity.this.receive.append("Connect Failed");
                    }
                });
                e.printStackTrace();
            } catch (IOException e2) {
                e2.printStackTrace();
                MainActivity.this.runOnUiThread(new Runnable() { // from class: com.keyestudio.IOTfarm.MainActivity.connectthread.3
                    @Override // java.lang.Runnable
                    public void run() {
                        Toast.makeText(MainActivity.this, "Connect Failed", 0).show();
                        MainActivity.this.receive.setText("");
                        MainActivity.this.receive.append("Connect Failed");
                    }
                });
            }
            if (MainActivity.this.socket == null) {
                return;
            }
            try {
                OutputStream outputStream = MainActivity.this.socket.getOutputStream();
                this.outputStream = outputStream;
                outputStream.write(123);
                while (true) {
                    try {
                        byte[] bArr = new byte[1024];
                        InputStream inputStream = MainActivity.this.socket.getInputStream();
                        this.inputStream = inputStream;
                        String str = new String(bArr, 0, inputStream.read(bArr));
                        Log.i("esp32发送过来的值", "值：" + str);
                        MainActivity.this.dataHandle(str);
                        MainActivity.this.runOnUiThread(new Runnable() { // from class: com.keyestudio.IOTfarm.MainActivity.connectthread.4
                            @Override // java.lang.Runnable
                            public void run() {
                                MainActivity.this.Temperature.setText("");
                                MainActivity.this.Humidity.setText("");
                                MainActivity.this.Soil_Humidity.setText("");
                                MainActivity.this.Light.setText("");
                                MainActivity.this.Water_Level.setText("");
                                MainActivity.this.Rainwater.setText("");
                                MainActivity.this.Temperature.append(Integer.toString(MainActivity.this.intData[0]) + MainActivity.this.strs[0]);
                                MainActivity.this.Humidity.append(Integer.toString(MainActivity.this.intData[1]) + MainActivity.this.strs[1]);
                                MainActivity.this.Soil_Humidity.append(Integer.toString(MainActivity.this.intData[2]) + MainActivity.this.strs[1]);
                                MainActivity.this.Water_Level.append(Integer.toString(MainActivity.this.intData[4]) + MainActivity.this.strs[1]);
                                MainActivity.this.Light.append(Integer.toString(MainActivity.this.intData[3]) + MainActivity.this.strs[1]);
                                MainActivity.this.Rainwater.append(Integer.toString(MainActivity.this.intData[5]) + MainActivity.this.strs[1]);
                            }
                        });
                    } catch (IOException unused) {
                        return;
                    }
                }
            } catch (IOException e3) {
                e3.printStackTrace();
            }
        }
    }
}
