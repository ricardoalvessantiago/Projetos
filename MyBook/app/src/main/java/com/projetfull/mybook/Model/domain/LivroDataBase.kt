package com.projetfull.mybook.Model.domain

import android.content.Context
import android.database.sqlite.SQLiteDatabase
import android.database.sqlite.SQLiteOpenHelper

class LivroDataBase(context: Context):SQLiteOpenHelper(context, DATABASE_NAME, null, DATABASE_VERSION){
    companion object {
        //db atualizador ->
        const val DATABASE_VERSION =1
        const val DATABASE_NAME = "livros.db"
        // dmn
        const val DB_TABLE_LIVROS = "livros"
        const val DB_FIELD_ID = "id"
        const val DB_FIELD_NAME = "name"
        const val DB_FIELD_TP_LIVRO = "tipoLivro"
        const val DB_FIELD_DESC = "desc"
        const val DB_FIELD_URL_FOTO = "UrlFoto"
        const val sqlCreateLivros = "CREATE TABLE IF NOT EXISTS $DB_TABLE_LIVROS (" +
                "$DB_FIELD_ID INTEGER PRIMARY KEY AUTOINCREMENT, " +
                "$DB_FIELD_NAME TEXT, " +
                "$DB_FIELD_TP_LIVRO TEXT, " +
                "$DB_FIELD_DESC TEXT, " +
                "$DB_FIELD_URL_FOTO TEXT,)";
    }
    override fun onCreate(db: SQLiteDatabase?) {
        val db = db ?: return

        db.beginTransaction()
        try {
            db.execSQL(sqlCreateLivros)
            db.setTransactionSuccessful()
        }
        finally {
            db.endTransaction()
        }
    }
    override fun onUpgrade(db: SQLiteDatabase?, oldVersion: Int, newVersion: Int) {

    }
}