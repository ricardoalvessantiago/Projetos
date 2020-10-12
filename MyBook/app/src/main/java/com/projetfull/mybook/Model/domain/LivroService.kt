/*package com.projetfull.mybook.domain

import android.content.Context

class LivroService {
    companion object{
        fun getLivros(context: Context?, tipo: TipoLivro): MutableList<Livro>{
            val tipoString = context?.getString(tipo.string)
            val livros = mutableListOf<Livro>()
            for (i in 1..36){
                val lv: Livro? = null
                lv?.nome = "Livros $tipoString: $i"
                lv?.desc = "Desc $i"
                lv?.UrlFoto = "http://bepid.hospedagemdesites.ws/images/pepa.png";
                livros.add(lv)
            }
            return livros
        }
    }
}*/
