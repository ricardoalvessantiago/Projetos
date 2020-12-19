package com.projetfull.startuspet.Controller

import android.content.Intent
import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import com.projetfull.startuspet.R
import kotlinx.android.synthetic.main.activity_form_login.*

class FormLogin : AppCompatActivity() {
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_form_login)

        val textoCadastrar = text_cadastrar

        textoCadastrar.setOnClickListener{
            AbrirTelaDeCadastro()
        }

        /*supportActionBar!!.hide()*/
    }
    private fun AbrirTelaDeCadastro(){
        var intent = Intent(this, MainActivity::class.java)
        startActivity(intent)
    }
}