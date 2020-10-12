package com.projetfull.mybook.adapter

import android.content.Context
import android.os.Bundle
import androidx.fragment.app.Fragment
import androidx.fragment.app.FragmentManager
import androidx.fragment.app.FragmentPagerAdapter
import androidx.navigation.Navigation
import com.projetfull.mybook.domain.TipoLivro
import com.projetfull.mybook.fragments.LivrosFragment

class TabsAdapter (private val context: Context, fm: FragmentManager) : FragmentPagerAdapter(fm) {
    // Qtde de Tabs
    override fun getCount() = 3

    // Retorna o tipo pela posição
    fun getTipoCarro(position: Int) = when (position) {
        0 -> TipoLivro.Classicos
        1 -> TipoLivro.Tecnicos
        else -> TipoLivro.Ficcao
        //-> TipoLivro.favoritos
    }

    // Título da Tab
    override fun getPageTitle(position: Int): CharSequence {
        val tipo = getTipoCarro(position)
        return context.getString(tipo.string)
    }

    // Fragment com a lista de carros
    override fun getItem(position: Int): Fragment {

        if (position == 3) {
            // Favoritos
            return Fragment()
        }
        // Clássicos, Técnicos e Ficção
        val tipo = getTipoCarro(position)
        val f: Fragment = LivrosFragment()
        val arguments = Bundle()
        arguments.putSerializable("tipo", tipo)
        f.arguments = arguments

        return f
    }
}