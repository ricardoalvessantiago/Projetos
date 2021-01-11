package com.projetfull.startuspet.Model

import android.content.ContentValues
import android.content.Context
import android.database.sqlite.SQLiteDatabase
import android.database.sqlite.SQLiteOpenHelper

class Database(context: Context): SQLiteOpenHelper(context, DATABASE_NAME, null, DATABASE_VERSION){
    companion object{
        const val DATABASE_VERSION = 1
        const val DATABASE_NAME = "pet.db"
        const val DB_TABLE_PETS = "pets"

        //
        const val DB_FIELD_ID = "id"
        const val DB_FIELD_NAME = "name"
        const val DB_FIELD_SPECIES = "species"
        const val DB_FIELD_RACA = "raca"
        const val DB_FIELD_COLOR = "color"
        const val DB_FIELD_SEX = "sex"
        const val DB_FIELD_DATA_NASC = "data_nasc"

        const val sqlCreatePets = "CREATE TABLE IF NOT EXISTS $DB_TABLE_PETS (" +
                "$DB_FIELD_ID INTEGER PRIMARY KEY AUTOINCREMENT, " +
                "$DB_FIELD_NAME TEXT, " +
                "$DB_FIELD_SPECIES TEXT, " +
                "$DB_FIELD_RACA  TEXT, " +
                "$DB_FIELD_COLOR TEXT, " +
                "$DB_FIELD_SEX TEXT, " +
                "$DB_FIELD_DATA_NASC DATA);"
        /*const val sqlCreateContacts = "CREATE TABLE IF NOT EXISTS $DB_TABLE_CONTACTS (" +
                "$DB_FIELD_ID INTEGER PRIMARY KEY AUTOINCREMENT, " +
                "$DB_FIELD_NAME TEXT, " +
                "$DB_FIELD_PHONE TEXT, " +
                "$DB_FIELD_CITY INTEGER);"
        const val sqlDropContacs = "DROP TABLE IF EXISTS $DB_TABLE_CONTACTS"*/



    }

    override fun onCreate(db: SQLiteDatabase?) {

        val db = db ?: return

        db.beginTransaction()
        try {
            db.execSQL(sqlCreatePets)
            db.setTransactionSuccessful()
        }
        finally {
            db.endTransaction()
        }
    }

    override fun onUpgrade(db: SQLiteDatabase?, oldVersion: Int, newVersion: Int) {
        val db = db ?: return

        val sql_drop_pets = "DROP TABLE IF EXISTS $DB_TABLE_PETS"
        db.execSQL(sql_drop_pets)
        onCreate(db)
    }

    override fun onDowngrade(db: SQLiteDatabase?, oldVersion: Int, newVersion: Int) {
        onUpgrade(db, oldVersion, newVersion)
    }


    fun addPet(animal: Animal): Long {
        val db = writableDatabase
        val values = ContentValues().apply {
            put(DB_FIELD_NAME, animal.nome)
            put(DB_FIELD_SPECIES, animal.especie)
            put(DB_FIELD_RACA, animal.raca)
            put(DB_FIELD_COLOR, animal.cor)
            put(DB_FIELD_SEX, animal.sexo)
        }
        val id = db.insert(DB_TABLE_PETS, "", values)
        db.close()
        return id
    }
}