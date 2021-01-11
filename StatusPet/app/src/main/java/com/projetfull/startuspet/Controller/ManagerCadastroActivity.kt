package com.projetfull.startuspet.Controller

import DataStore
import android.app.DatePickerDialog
import android.content.Intent
import android.graphics.Bitmap
import android.os.Bundle
import android.view.Menu
import android.view.MenuItem
import androidx.appcompat.app.AppCompatActivity
import com.projetfull.startuspet.Model.Animal
import com.projetfull.startuspet.R
import kotlinx.android.synthetic.main.activity_manager_cadastro.*
import java.util.*

class ManagerCadastroActivity : AppCompatActivity() {
    var position = 0
    var type = 0
    var petName = ""

    //variáveis do código da sthefany
    lateinit var bitmap: Bitmap
    val REQUEST_IMAGE_CAPTURE = 3
    val IMAGE_PICK_CODE = 4
    var imageAdded: Boolean = false

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_manager_cadastro)

        DataStore.setContext(this)
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

        val c = Calendar.getInstance()
        val year = c.get(Calendar.YEAR)
        val month = c.get(Calendar.MONTH)
        val day = c.get(Calendar.DAY_OF_MONTH)

        txtCdata.setOnClickListener {
            val dpd = DatePickerDialog(
                this,
                DatePickerDialog.OnDateSetListener { view, mYear, mMonth, mDay ->
                    // set to textView

                },
                year,
                month,
                day
            )
            dpd.show()
        }
        btnCarregarImg.setOnClickListener {
            SelecionarFotoDaGaleria()
            /*if (ContextCompat.checkSelfPermission(
                    this,
                    android.Manifest.permission.CAMERA
                ) == PackageManager.PERMISSION_GRANTED
            ) {
                val intent = Intent(MediaStore.ACTION_IMAGE_CAPTURE)
                startActivityForResult(intent, CAMERA_REQUEST_CODE)
            } else {
                ActivityCompat.requestPermissions(
                    this,
                    arrayOf(android.Manifest.permission.CAMERA),
                    CAMERA_PERMISSION_CODE
                )
            }*/
        }
        btnHomePage.setOnClickListener{
            var intent = Intent(this, MainActivity::class.java)
            startActivity(intent)
            finish()
        }


    }

    //código de gerenciamento:
    private fun SelecionarFotoDaGaleria() {
        val intent = Intent(Intent.ACTION_PICK)
        intent.type = "image/*"
        startActivityForResult(intent, IMAGE_PICK_CODE)
    }

    override fun onCreateOptionsMenu(menu: Menu?): Boolean {
        menuInflater.inflate(R.menu.menu_manager_animal, menu)
        return true
    }

    override fun onOptionsItemSelected(item: MenuItem): Boolean {
        when (item.itemId) {
            R.id.mnuSave -> {
                val pet = Animal(
                    txtCnome.text.toString(),
                    txtCespecie.text.toString(),
                    txtCraca.text.toString(),
                    txtCcor.text.toString(),
                    txtCsexo.checkedRadioButtonId.toString(),
                )

                petName = pet.nome
                if (type == 1) {
                    DataStore.addAnimal(pet, this)
                } else if (type == 2) {
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

    fun setStatus(status: Boolean) {
        if (status) {
            val intent = Intent().apply {
                putExtra("petName", petName)
            }
            setResult(RESULT_OK, intent)
        } else {
            setResult(RESULT_CANCELED)
        }
        finish()
    }
}

/*//Camera
override fun onRequestPermissionsResult(
    requestCode: Int,
    permissions: Array<out String>,
    grantResults: IntArray
) {
    when (requestCode) {
        MainActivity.CAMERA_PERMISSION_CODE -> {
            if (grantResults.isNotEmpty() && grantResults[0] == PackageManager.PERMISSION_GRANTED) {
                //permission from popup granted
                pickImageFromGallery()
            } else {
                //permission from popup denied
                Toast.makeText(this, "Permission denied", Toast.LENGTH_SHORT).show()
            }
        }
    }
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
        bitmap = (imagemId.drawable as BitmapDrawable).bitmap
        imageAdded = true
    }
}
    //selecionar foto da galeria
private fun pickImageFromGallery() {
    //Intent to pick image
    val intent = Intent(Intent.ACTION_PICK)
    intent.type = "image/*"
    startActivityForResult(intent, IMAGE_PICK_CODE)
}

// :>

private fun bitmapToFile(bitmap: Bitmap): Uri {
    // Get the context wrapper
    val wrapper = ContextWrapper(applicationContext)

    // Initialize a new file instance to save bitmap object
    var file = wrapper.getDir("Images", Context.MODE_PRIVATE)
    file = File(file, "${UUID.randomUUID()}.jpg")

    try {
        // Compress the bitmap and save in jpg format
        val stream: OutputStream = FileOutputStream(file)
        bitmap.compress(Bitmap.CompressFormat.JPEG, 100, stream)
        stream.flush()
        stream.close()
    } catch (e: IOException) {
        e.printStackTrace()
    }

    // Return the saved bitmap uri
    return Uri.parse(file.absolutePath)
}


}
*/