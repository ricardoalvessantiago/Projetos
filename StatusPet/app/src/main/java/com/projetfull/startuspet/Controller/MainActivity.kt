package com.projetfull.startuspet.Controller

import android.Manifest.permission
import android.Manifest.permission_group
import android.annotation.SuppressLint
import android.content.Intent
import android.content.pm.PackageManager
import android.graphics.BitmapFactory
import android.media.MediaScannerConnection
import android.net.Uri
import android.os.Build
import android.os.Bundle
import android.provider.MediaStore
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
import com.projetfull.startuspet.R


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