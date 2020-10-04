package com.projetfull.mybook.domain

import android.os.Parcel
import android.os.Parcelable

class Livro(var tipoLivro: String, var nome: String, var desc: String)  {
    var id: Long = 0;
    var UrlFoto = "";

}