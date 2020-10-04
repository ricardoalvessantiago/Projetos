package com.projetfull.mybook.activity

import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import android.view.View
import br.com.livroandroid.carros.extensions.setupToolbar
import com.projetfull.mybook.R
import com.projetfull.mybook.adapter.LivroAdapter
import com.projetfull.mybook.domain.Livro
import com.projetfull.mybook.domain.TipoLivro
import com.squareup.picasso.Picasso
import kotlinx.android.synthetic.main.activity_livro.*
import kotlinx.android.synthetic.main.activity_livro.view.*
import kotlinx.android.synthetic.main.adapter_livro.*
import kotlinx.android.synthetic.main.include_toolbar.*
import kotlinx.android.synthetic.main.nav_drawer_main.*
import kotlinx.android.synthetic.main.nav_header_main.view.*
import java.lang.Exception

class LivroActivity : BaseActivity() {
    private var tipo: TipoLivro = TipoLivro.Classicos
    private var livros = listOf<Livro>()
      val livro: Livro? = null
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_livro)
        setupToolbar(R.id.toolbar, livro?.nome, true)
        tDesc.text = livro?.desc
    }

        //lê o parementro

}
