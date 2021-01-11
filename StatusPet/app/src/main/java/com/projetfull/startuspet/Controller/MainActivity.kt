package com.projetfull.startuspet.Controller

import DataStore
import android.app.Activity
import android.content.Intent
import android.net.Uri
import android.os.Bundle
import android.provider.MediaStore
import androidx.appcompat.app.AppCompatActivity
import androidx.recyclerview.widget.LinearLayoutManager
import com.projetfull.startuspet.R
import com.projetfull.startuspet.View.PetAdapter
import kotlinx.android.synthetic.main.activity_main.*

import kotlinx.android.synthetic.main.activity_manager_cadastro.*


class MainActivity : AppCompatActivity() {
    val REQUEST_IMAGE_CAPTURE = 3
    val IMAGE_PICK_CODE = 4
    val REQUEST_CODE_ADD = 1
    val REQUERT_CODE_UPDATE = 2



    companion object {
        const val CAMERA_PERMISSION_CODE = 1
        private const val CAMERA_REQUEST_CODE = 2
    }
    private var adapter: PetAdapter? = null




    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_main)//aqui estou abrindo o layout para gerenciar o cadastro

        DataStore.setContext(this)
        val layoutManager = LinearLayoutManager(this)
        rcvPets.layoutManager = layoutManager
        adapter = PetAdapter(DataStore.animais)
        rcvPets.adapter = adapter


    }
    private var SelecionarUri: Uri? =null
    override fun onActivityResult(requestCode: Int, resultCode: Int, data: Intent?) {
        super.onActivityResult(requestCode, resultCode, data)
        if (requestCode == REQUEST_IMAGE_CAPTURE && resultCode == RESULT_OK) {
            SelecionarUri = data?.data
            val imageBitmap = MediaStore.Images.Media.getBitmap(contentResolver, SelecionarUri)
            imagemId.setImageBitmap(imageBitmap)
            btnCarregarImg.alpha = 0f

        }
        if (resultCode == Activity.RESULT_OK && requestCode == IMAGE_PICK_CODE) {
            imagemId.setImageURI(data?.data)
           /* bitmap = (imagemId.drawable as BitmapDrawable).bitmap
            imageAdded = true*/
        }
    }


   /* val getureDetector = GestureDetector(this, object : GestureDetector.SimpleOnGestureListener(){

    } )*/


}