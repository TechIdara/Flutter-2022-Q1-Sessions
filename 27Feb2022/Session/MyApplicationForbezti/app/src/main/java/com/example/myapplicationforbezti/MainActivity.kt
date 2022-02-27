package com.example.myapplicationforbezti

import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import android.view.View
import android.widget.Button
import android.widget.TextView

class MainActivity : AppCompatActivity() {
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_main)
        findViewById<Button>(R.id.meraBtn).setOnClickListener(View.OnClickListener {

            findViewById<TextView>(R.id.mera1stTextView).text = "";
            findViewById<TextView>(R.id.mera1stTextView).text = "";
            findViewById<TextView>(R.id.mera1stTextView).text = "";
        })
    }
}