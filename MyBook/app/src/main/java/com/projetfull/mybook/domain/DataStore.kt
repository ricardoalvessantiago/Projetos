import android.content.Context
import android.util.Log
import com.projetfull.mybook.R
import com.projetfull.mybook.domain.Livro
import java.io.File
import java.io.IOException

object DataStore {
    var login ="teste@teste.com"
        private set
    var password ="123456"
        private set

    var books: MutableList<Livro> = arrayListOf()
        private set
    var Author: MutableList<String> = arrayListOf()
        private set

    private var context: Context? = null

    fun setContext(value: Context){
        context = value
        loadData()
        loadAuthor()
    }

    fun getBook(position: Int): Livro{
        return books.get(position)
    }
    fun addBook(book: Livro){
        books.add(book)
        saveData()
    }
    fun editBook(book: Livro, position: Int){
        books.set(position, book)
        saveData()
    }
    fun removeBook(position: Int){
        books.removeAt(position)
        saveData()
    }
    fun clearBook(){
        books.clear()
        saveData()
    }

    fun loadData(){

        val context = context ?: return
        val file = File(context.filesDir.absolutePath + "/${context.getString(R.string.filename_books)}")

        if (file.exists()){

            file.bufferedReader().use {
                val iterator = it.lineSequence().iterator()
                while (iterator.hasNext()){
                        val name = iterator.next()
                        val tipoLivro = iterator.next()
                        val desc = iterator.next()
                        addBook(Livro(name, tipoLivro, desc))

                }
            }
        }
        else{
            loadInitialData()
            //Criação do arquivo de gravação de dados
        }
    }
    fun loadAuthor(){
        val context = context ?: return

        try {
            val file = context.assets.open("Author.txt")
            file.bufferedReader().use {
                val iterator = it.lineSequence().iterator()
                while (iterator.hasNext()){

                    val autor = iterator.next()
                    Author.add(autor)
                }

            }
        }catch (e: IOException){
            Log.d("Persistence Book", "Arquivo não encontrado, ${e.localizedMessage}")
            return
        }
    }

    fun saveData(){

        val context = context ?: return
        val file = File(context.filesDir.absolutePath + "/${context.getString(R.string.filename_books)}")

        if (!file.exists()){
            file.createNewFile()
        }
        else{

            file.writeText("")
        }

        file.printWriter().use{
            for (book in books){

                it.println(book.nome)
                it.println(book.tipoLivro)
                it.println(book.desc)
            }
        }
    }
    fun loadInitialData(){

        val context = context ?: return
        try {
            val file = context.assets.open("")
            file.bufferedReader().use {
                val iterator = it.lineSequence().iterator()
                while (iterator.hasNext()){
                    val name = iterator.next()
                    val tipoLivro = iterator.next()
                    val desc = iterator.next()
                    addBook(Livro(name, tipoLivro, desc))

                }

            }
        }catch (e: IOException){
            Log.d("Persistence Book", "Arquivo não encontrado, ${e.localizedMessage}")
            return
        }

        saveData()
    }
}