package com.projetfull.startuspet.Controller

import android.app.Activity
import android.content.Context
import android.content.ContextWrapper
import android.content.Intent
import android.content.pm.PackageManager
import android.graphics.Bitmap
import android.graphics.drawable.BitmapDrawable
import android.net.Uri
import android.os.Bundle
import android.provider.MediaStore
import android.widget.Toast
import androidx.appcompat.app.AppCompatActivity
import androidx.core.app.ActivityCompat
import androidx.core.content.ContextCompat
import com.projetfull.startuspet.R
import kotlinx.android.synthetic.main.activity_main.*
import java.io.File
import java.io.FileOutputStream
import java.io.IOException
import java.io.OutputStream
import java.util.*


class MainActivity : AppCompatActivity() {
    companion object{
        const val CAMERA_PERMISSION_CODE = 1
        private const val CAMERA_REQUEST_CODE = 2
    }



    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_main)
        btnCarregarImg.setOnClickListener {
            if (ContextCompat.checkSelfPermission(
                    this,
                   android.Manifest.permission.CAMERA
                ) == PackageManager.PERMISSION_GRANTED
            ) {
                val intent = Intent(MediaStore.ACTION_IMAGE_CAPTURE)
                startActivityForResult(intent, CAMERA_REQUEST_CODE)
            } else {
                ActivityCompat.requestPermissions(
                    this,
                    arrayOf( android.Manifest.permission.CAMERA),
                    CAMERA_PERMISSION_CODE
                )
            }


        }
    }
    //código de gerenciamento:

}