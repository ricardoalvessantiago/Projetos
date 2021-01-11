import android.content.Context
import android.util.Log
import com.projetfull.startuspet.Controller.ManagerCadastroActivity
import com.projetfull.startuspet.Model.Animal
import com.projetfull.startuspet.Model.Database
import com.projetfull.startuspet.R
import java.io.File
import java.io.IOException

object DataStore {
    var login = "teste@teste.com"
        private set
    var password = "123456"
        private set

    var animais: MutableList<Animal> = arrayListOf()
        private set
    private var database: Database? = null

    fun setContext(context: Context) {
       
    }


    //
    private var context: Context? = null
    fun setContext1(value: Context) {
        context = value
        loadData()
        loadAuthor()
    }
    //


    fun getAnimal(position: Int): Animal {
        return animais.get(position)
    }

    fun addAnimal(animal: Animal, managerCadastroActivity: ManagerCadastroActivity) {
        val id = database?.addPet(animal) ?: return
        animal.id = id
        animais.add(animal)
        Log.d("SQLite!", "1 Registro incluido com sucesso!!!")
        saveData()
    }

    fun editAnimal(
        animal: Animal,
        position: Int,
        managerCadastroActivity: ManagerCadastroActivity
    ) {
        animais.set(position, animal)
        saveData()
    }

    fun removeAnimal(position: Int) {
        animais.removeAt(position)
        saveData()
    }

    fun clearAnimal() {
        animais.clear()
        saveData()
    }

    fun loadData() {

        val context = context ?: return
        val file =
            File(context.filesDir.absolutePath + "/${context.getString(R.string.filename_animais)}")

        if (file.exists()) {
            file.bufferedReader().use {
                val iterator = it.lineSequence().iterator()
                while (iterator.hasNext()) {
                    /* val name = iterator.next()
                     val tipoLivro = iterator.next()
                     val desc = iterator.next()
                     addAnimal(Animal(name, tipoLivro, desc))*/
                }
            }
        } else {
            loadInitialData()
            //Criação do arquivo de gravação de dados
        }
    }

    fun loadAuthor() {
        val context = context ?: return

        try {
            val file = context.assets.open("Author.txt")
            file.bufferedReader().use {
                val iterator = it.lineSequence().iterator()
                while (iterator.hasNext()) {

                    //val autor = iterator.next()

                }

            }
        } catch (e: IOException) {
            Log.d("Persistence Book", "Arquivo não encontrado, ${e.localizedMessage}")
            return
        }
    }

    fun saveData() {

        val context = context ?: return
        val file =
            File(context.filesDir.absolutePath + "/${context.getString(R.string.filename_animais)}")

        if (!file.exists()) {
            file.createNewFile()
        } else {

            file.writeText("")
        }

        file.printWriter().use {
            for (animal in animais) {

                it.println(animal.nome)
                it.println(animal.especie)
                it.println(animal.sexo)
                it.println(animal.raca)
                it.println(animal.cor)

            }
        }
    }

    fun loadInitialData() {

        val context = context ?: return
        try {
            val file = context.assets.open("")
            file.bufferedReader().use {
                val iterator = it.lineSequence().iterator()
                while (iterator.hasNext()) {
                    /*  val name = iterator.next()
                      val tipoLivro = iterator.next()
                      val desc = iterator.next()
                      addAnimal(Animal(name, tipoLivro, desc))*/

                }

            }
        } catch (e: IOException) {
            Log.d("Projeto status pet", "Arquivo não encontrado, ${e.localizedMessage}")
            return
        }

        saveData()
    }
}