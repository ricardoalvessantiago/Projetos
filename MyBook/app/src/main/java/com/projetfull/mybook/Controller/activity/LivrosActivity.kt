package com.projetfull.mybook.activity

import android.os.Bundle
import br.com.livroandroid.carros.extensions.setupToolbar
import com.projetfull.mybook.R
import com.projetfull.mybook.domain.Livro

import com.projetfull.mybook.domain.TipoLivro
import com.projetfull.mybook.fragments.LivrosFragment

class LivrosActivity : BaseActivity() {
    private var tipo = TipoLivro.Classicos
    private var livros = listOf<Livro>()
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_livros)
        setupToolbar(R.id.toolbar)
        supportActionBar?.setDisplayHomeAsUpEnabled(true)
        //->>
       //this.tipo = intent.getParcelableExtra<Livro>("tipo") as TipoLivro
        val s = context.getString(tipo.string)
        supportActionBar?.title = s
        if (savedInstanceState == null){
            val flag = LivrosFragment()
            flag.arguments = intent.extras
            supportFragmentManager.beginTransaction().add(R.id.container, flag).commit()
        }


    }
}



