package com.projetfull.mybook.fragments

import android.os.Bundle
import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import androidx.recyclerview.widget.DefaultItemAnimator
import androidx.recyclerview.widget.LinearLayoutManager
import com.projetfull.mybook.R
import com.projetfull.mybook.Controller.activity.LivroActivity
import com.projetfull.mybook.View.adapter.LivroAdapter
import com.projetfull.mybook.domain.Livro

import com.projetfull.mybook.domain.TipoLivro
import kotlinx.android.synthetic.main.fragment_livros.*
import org.jetbrains.anko.startActivity

class LivrosFragment : BaseFragment() {
    private var tipo = TipoLivro.Classicos
    private var livros = listOf<Livro>()

    override fun onCreateView(inflater: LayoutInflater, container: ViewGroup?, savedInstanceState: Bundle?): View? {
        // Retorna a view /res/layout/fragment_carros.xml
        //this.tipo = arguments?.getParcelable<Livro>("tipo") as TipoLivro
        return inflater.inflate(R.layout.fragment_livros, container, false)
    }
    override fun onViewCreated(view: View, savedInstanceState: Bundle?) {
        super.onViewCreated(view, savedInstanceState)
        // Views
        recycleView.layoutManager = LinearLayoutManager(activity)
        recycleView.itemAnimator = DefaultItemAnimator()
        recycleView.setHasFixedSize(true)


    }

    override fun onResume() {
        super.onResume()
        taskLivros()
    }

    private fun taskLivros() {

        recycleView.adapter = LivroAdapter(livros) { onClickLivro(it)}

    }

    private fun onClickLivro(livro: Livro) {
        activity?.startActivity<LivroActivity>("livro" to livro)
    }


}
