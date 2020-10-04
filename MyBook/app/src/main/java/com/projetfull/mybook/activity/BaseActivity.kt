package com.projetfull.mybook.activity

import android.annotation.SuppressLint
import android.content.Context
import androidx.appcompat.app.AppCompatActivity

@SuppressLint("Registered")
open class BaseActivity : AppCompatActivity() {

    protected val context: Context get() = this

    //Métodos padrão para todas as activitys aqui!
}