package com.projetfull.startuspet.Controller

import android.content.Intent
import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import android.view.Menu
import android.view.MenuItem
import com.projetfull.startuspet.Model.Animal
import com.projetfull.startuspet.R
import kotlinx.android.synthetic.main.activity_main.*

class ManagerCadastroActivity : AppCompatActivity() {  var position = 0
    var type = 0
    var petyName = ""

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

    fun setStatus(status: Boolean) {

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
}
