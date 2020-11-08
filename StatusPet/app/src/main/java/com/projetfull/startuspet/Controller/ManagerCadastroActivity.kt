package com.projetfull.startuspet.Controller

import android.app.Activity
import android.content.Context
import android.content.ContextWrapper
import android.content.Intent
import android.content.pm.PackageManager
import android.graphics.Bitmap
import android.graphics.drawable.BitmapDrawable
import android.net.Uri
import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import android.view.Menu
import android.view.MenuItem
import android.widget.Toast

import com.projetfull.startuspet.Model.Animal
import com.projetfull.startuspet.R
import kotlinx.android.synthetic.main.activity_main.*
import java.io.File
import java.io.FileOutputStream
import java.io.IOException
import java.io.OutputStream
import java.util.*

class ManagerCadastroActivity : AppCompatActivity() {




    var position = 0
    var type = 0
    var petyName = ""
    //variáveis do código da sthefany
    lateinit var bitmap: Bitmap
    val REQUEST_IMAGE_CAPTURE = 3
    val IMAGE_PICK_CODE = 4
    var imageAdded: Boolean = false

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_manager_cadastro)
        setSupportActionBar(toolbar)
        supportActionBar?.setDisplayHomeAsUpEnabled(true)
        supportActionBar?.title = "Gerenciar Cadastro"


        type = intent.getIntExtra("type", 1)

        if (type == 2) {

            position = intent.getIntExtra("position", 0)
            val pet = DataStore.getAnimal(position)

            txtCnome.setText(pet.nome)
            txtCespecie.setText(pet.especie)
            txtCraca.setText(pet.raca)

            txtCcor.setText(pet.cor)
          //  txtCdata.setText(pet.data) faltou ligar esse parametro "Analisar opções"
        }
    }

    override fun onCreateOptionsMenu(menu: Menu?): Boolean {
        menuInflater.inflate(R.menu.menu_manager_animal, menu)
        return true
    }

    override fun onOptionsItemSelected(item: MenuItem): Boolean {
        when(item.itemId) {
            R.id.mnuSave -> {
                val pet = Animal(txtCnome.text.toString(), txtCespecie.text.toString(), txtCsexo.text.toString(), txtCraca.text.toString(), txtCcor.text.toString())
                petyName = pet.nome
                if (type == 1) {
                    DataStore.addAnimal(pet, this)
                }
                else if (type == 2) {
                    pet.id = DataStore.getAnimal(position).id
                    DataStore.editAnimal(pet, position, this)
                }
            }
            android.R.id.home -> {
                finish()
            }
        }
        return super.onOptionsItemSelected(item)
    }

    fun setStatus(status: Boolean){
        if (status) {
            val intent = Intent().apply {
                putExtra("petyName", petyName)
            }
            setResult(RESULT_OK, intent)
        }
        else {
            setResult(RESULT_CANCELED)
        }
        finish()
    }

    //Camera
    override fun onRequestPermissionsResult(requestCode: Int, permissions: Array<out String>, grantResults: IntArray) {
        when(requestCode){
            MainActivity.CAMERA_PERMISSION_CODE -> {
                if (grantResults.isNotEmpty() && grantResults[0] == PackageManager.PERMISSION_GRANTED){
                    //permission from popup granted
                    pickImageFromGallery()
                }
                else{
                    //permission from popup denied
                    Toast.makeText(this, "Permission denied", Toast.LENGTH_SHORT).show()
                }
            }
        }
    }


    override fun onActivityResult(requestCode: Int, resultCode: Int, data: Intent?) {
        super.onActivityResult(requestCode, resultCode, data)
        if (requestCode == REQUEST_IMAGE_CAPTURE && resultCode == RESULT_OK) {
            val imageBitmap = data!!.extras!!.get("data") as Bitmap
            imagemId.setImageBitmap(imageBitmap)
            bitmap = imageBitmap
            imageAdded = true
        }
        if (resultCode == Activity.RESULT_OK && requestCode == IMAGE_PICK_CODE){
            imagemId.setImageURI(data?.data)
            bitmap = (imagemId.drawable as BitmapDrawable).bitmap
            imageAdded = true
        }
    }
    private fun pickImageFromGallery() {
        //Intent to pick image
        val intent = Intent(Intent.ACTION_PICK)
        intent.type = "image/*"
        startActivityForResult(intent, IMAGE_PICK_CODE)
    }

    // :>

    private fun bitmapToFile(bitmap:Bitmap): Uri {
        // Get the context wrapper
        val wrapper = ContextWrapper(applicationContext)

        // Initialize a new file instance to save bitmap object
        var file = wrapper.getDir("Images", Context.MODE_PRIVATE)
        file = File(file,"${UUID.randomUUID()}.jpg")

        try{
            // Compress the bitmap and save in jpg format
            val stream: OutputStream = FileOutputStream(file)
            bitmap.compress(Bitmap.CompressFormat.JPEG,100,stream)
            stream.flush()
            stream.close()
        }catch (e: IOException){
            e.printStackTrace()
        }

        // Return the saved bitmap uri
        return Uri.parse(file.absolutePath)
    }

}
