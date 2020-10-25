package com.projetfull.startuspet.Controller

import android.Manifest.permission
import android.Manifest.permission_group
import android.annotation.SuppressLint
import android.content.Context
import android.content.Intent
import android.content.pm.PackageManager
import android.graphics.BitmapFactory
import android.hardware.Camera
import android.media.MediaScannerConnection
import android.net.Uri
import android.os.Build
import android.os.Bundle
import android.os.Environment
import android.os.Environment.getExternalStorageDirectory
import android.provider.MediaStore
import android.provider.MediaStore.Files.FileColumns.MEDIA_TYPE_IMAGE
import android.provider.Settings
import android.util.Log
import android.view.View
import android.widget.Button
import android.widget.ImageView
import android.widget.Toast
import androidx.annotation.RequiresApi
import androidx.appcompat.app.AlertDialog
import androidx.appcompat.app.AppCompatActivity
import androidx.core.app.ActivityCompat
import androidx.core.content.FileProvider
import com.projetfull.startuspet.R
import java.io.File
import java.io.FileNotFoundException
import java.io.FileOutputStream
import java.io.IOException
import java.util.jar.Manifest


@Suppress("DEPRECATION")
class MainActivity : AppCompatActivity() {
    private val ROTEAMENTO_RAIZ = "minhasFotos/"
    private val ROTA_IMAGEM = ROTEAMENTO_RAIZ + "Fotos"
    val COD_SELECCIONA = 10
    val COD_FOTO = 20
    var botonCarregar: Button? = null
    var imagem: ImageView? = null
    var path: String? = null
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_main)
        imagem = findViewById<View>(R.id.imagemId) as ImageView
        botonCarregar= findViewById(R.id.btnCarregarImg);
        botonCarregar?.isEnabled()
    }

    private fun validaPermissions(): Boolean {
        if (Build.VERSION.SDK_INT < Build.VERSION_CODES.M) {
            return true
        }
        if (ActivityCompat.checkSelfPermission(this, permission.READ_EXTERNAL_STORAGE) == PackageManager.PERMISSION_GRANTED &&
            checkSelfPermission(permission.WRITE_EXTERNAL_STORAGE) == PackageManager.PERMISSION_GRANTED
        ) {
            return true
        }
        if (shouldShowRequestPermissionRationale(permission_group.CAMERA) ||
            shouldShowRequestPermissionRationale(permission.WRITE_EXTERNAL_STORAGE)
        ) {
            cargarDialogoRecomendacion()
        } else {
            requestPermissions(
                arrayOf(permission.WRITE_EXTERNAL_STORAGE, permission_group.CAMERA),
            100)
        }
        return true//false
    }

    override fun onRequestPermissionsResult(
        requestCode: Int,
        permissions: Array<String>,
        grantResults: IntArray
    ) {
        super.onRequestPermissionsResult(requestCode, permissions, grantResults)
        if (requestCode == 100) {
            if (grantResults.size == 2 && grantResults[0] == PackageManager.PERMISSION_GRANTED && grantResults[1] == PackageManager.PERMISSION_GRANTED) {
                botonCarregar!!.isEnabled = true
            } else {
                solicitarPermisosManual()
            }
        }
    }

    private fun solicitarPermisosManual() {
        val opcoes = arrayOf<CharSequence>("sim", "não")
        val alertOpcoes = AlertDialog.Builder(this@MainActivity)
        alertOpcoes.setTitle("Você deseja configurar as permissões manualmente?")
        alertOpcoes.setItems(opcoes) { dialogInterface, i ->
            if (opcoes[i] == "sim") {
                val intent = Intent()
                intent.action = Settings.ACTION_APPLICATION_DETAILS_SETTINGS
                val uri = Uri.fromParts("package", packageName, null)
                intent.data = uri
                startActivity(intent)
            } else {
                Toast.makeText(
                    applicationContext,
                    "As licenças não foram aceitas",
                    Toast.LENGTH_SHORT
                ).show()
                dialogInterface.dismiss()
            }
        }
        alertOpcoes.show()
    }

    @RequiresApi(Build.VERSION_CODES.M)
    private fun cargarDialogoRecomendacion() {
        val dialogo = AlertDialog.Builder(this@MainActivity)
        dialogo.setTitle("Permisões Desativadas")
        dialogo.setMessage("Você deve aceitar as permissões para o funcionamento correto do App")
        dialogo.setPositiveButton("Aceitar") { dialogInterface, i ->
            requestPermissions(
                arrayOf(
                    permission.WRITE_EXTERNAL_STORAGE,
                    permission_group.CAMERA
                ), 100
            )
        }
        dialogo.show()
    }

    fun onclick(view: View) {
        carregarImagem()
    }
    /*private val mPicture = Camera.PictureCallback { data, _ ->
        val pictureFile: File = getOutputMediaFile(MEDIA_TYPE_IMAGE) ?: run {
            Log.d(TAG, ("Error creating media file, check storage permissions"))
            return@PictureCallback
        }

        try {
            val fos = FileOutputStream(pictureFile)
            fos.write(data)
            fos.close()
        } catch (e: FileNotFoundException) {
            Log.d(TAG, "File not found: ${e.message}")
        } catch (e: IOException) {
            Log.d(TAG, "Error accessing file: ${e.message}")
        }
    }
*/
    private fun carregarImagem() {
        val opciones = arrayOf<CharSequence>("Tirar Foto", "Carregar Imagen", "Cancelar")
        val alertOpciones = AlertDialog.Builder(this@MainActivity)
        alertOpciones.setTitle("Selecione uma Opção")
        alertOpciones.setItems(opciones) { dialogInterface, i ->
            if (opciones[i] == "Tirar Foto") {
                tirarFotografia()
            } else {
                if (opciones[i] == "Carregar Imagen") {
                    val intent = Intent(
                        Intent.ACTION_GET_CONTENT,
                        MediaStore.Images.Media.EXTERNAL_CONTENT_URI
                    )
                    intent.type = "image/"
                    startActivityForResult(
                        Intent.createChooser(intent, "Selecione a aplicação"),
                        COD_SELECCIONA
                    )
                } else {
                    dialogInterface.dismiss()
                }
            }
        }
        alertOpciones.show()
    }

    private fun tirarFotografia() {
        val fileImagen = File(getExternalStorageDirectory(), ROTA_IMAGEM)
        var isCreada = fileImagen.exists()
        var nomeImagen = ""
        if (!isCreada) {
            isCreada = fileImagen.mkdirs()
        }
        if (isCreada) {
            nomeImagen = (System.currentTimeMillis() / 1000).toString() + ".jpg"
        }
        path = getExternalStorageDirectory().toString() +
                File.separator + ROTA_IMAGEM + File.separator + nomeImagen
        val imagen = File(path)
        var intent: Intent? = null
        intent = Intent(MediaStore.ACTION_IMAGE_CAPTURE)
        ////
       /* if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.N) {
            val authorities = applicationContext.packageName + ".provider"
            val imageUri = FileProvider.getUriForFile(this, authorities, imagen)
            intent.putExtra(MediaStore.EXTRA_OUTPUT, imageUri)
        } else {
            intent.putExtra(MediaStore.EXTRA_OUTPUT, Uri.fromFile(imagen))
        }*/
        startActivityForResult(intent, COD_FOTO)

        ////
    }

    @SuppressLint("LongLogTag")
    override fun onActivityResult(requestCode: Int, resultCode: Int, data: Intent?) {
        super.onActivityResult(requestCode, resultCode, data)
        if (resultCode == RESULT_OK) {
            when (requestCode) {
                COD_SELECCIONA -> {
                    val miPath = data!!.data
                    imagem!!.setImageURI(miPath)
                }
                COD_FOTO -> {
                    MediaScannerConnection.scanFile(
                        this, arrayOf(path), null
                    ) { path, uri -> Log.i("Rota de armazenenamento", "Path: $path") }
                    val bitmap = BitmapFactory.decodeFile(path)
                    imagem!!.setImageBitmap(bitmap)
                }
            }
        }
    }
}