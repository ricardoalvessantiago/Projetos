package com.projetfull.mybook.ui.gallery

import androidx.lifecycle.LiveData
import androidx.lifecycle.MutableLiveData
import androidx.lifecycle.ViewModel

class GalleryViewModel : ViewModel() {

    private val _text = MutableLiveData<String>().apply {
        value = "This is gallery Fragment" +
                "\nIniciando o projeto Meus livros" +
                "\n* galeria com o grupos do livros"
    }
    val text: LiveData<String> = _text
}