package com.projetfull.mybook.adapter

import android.icu.number.NumberFormatter.with
import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import android.widget.ImageView
import android.widget.ProgressBar
import android.widget.TextView
import androidx.cardview.widget.CardView
import androidx.recyclerview.widget.RecyclerView
import com.projetfull.mybook.R
import com.projetfull.mybook.domain.Livro
import com.squareup.picasso.Picasso
import kotlinx.android.synthetic.main.adapter_livro.view.*
import java.lang.Exception

class LivroAdapter(
    val livros: List<Livro>,
    val onClick: (Livro) -> Unit) : RecyclerView.Adapter<LivroAdapter.LivrosViewHolder>() {
    // Retornar a quantidade de livros na lista
    override fun getItemCount(): Int {
        return this.livros.size
    }

    // Infla o layout do adapter e retorna o ViewHolder
    override fun onCreateViewHolder(parent: ViewGroup, viewType: Int): LivrosViewHolder {
        // Infla a view do adapter
        val view =
            LayoutInflater.from(parent.context).inflate(R.layout.adapter_livro, parent, false)
        // Retorna o ViewHolder que contém todas as views
        return LivrosViewHolder(view)
    }

    // Faz o bind para atualizar o valor das views com os dados do Livro
    override fun onBindViewHolder(holder: LivrosViewHolder, position: Int) {
        val context = holder.itemView.context
        // Recupera o objeto do livro
        val livro = livros[position]
        val view = holder.itemView
        view.tNome.text = livro.nome
        holder.progress.visibility = View.VISIBLE




        if (livro.UrlFoto.trim().isEmpty()) {
            holder.img.setImageBitmap(null)
        } else {
            view.tNome.text = livro.nome
            Picasso.get().load(livro.UrlFoto).fit().into(holder.img,
                object : com.squareup.picasso.Callback {
                    override fun onSuccess() {
                        holder.progress.visibility = View.GONE
                    }

                    override fun onError(e: Exception?) {
                        holder.progress.visibility = View.GONE
                    }
                })
        }


        holder.itemView.setOnClickListener { onClick(livro) }


    }

    inner class LivrosViewHolder(view: View) : RecyclerView.ViewHolder(view) {
        var tNome: TextView
        var img: ImageView
        var progress: ProgressBar
        var cardView: CardView

        init {
            tNome = view.findViewById(R.id.tNome)
            img = view.findViewById(R.id.imagem)
            progress = view.findViewById(R.id.progress)
            cardView = view.findViewById(R.id.card_view)
        }
    }

}
