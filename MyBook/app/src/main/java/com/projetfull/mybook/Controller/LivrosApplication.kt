package com.projetfull.mybook

import android.app.Application
import android.util.Log

class LivrosApplication: Application(){
    private val TAG = "LivrosApplication"

    // Chamado quando o Android criar o processo da aplicação
    override fun onCreate() {
        super.onCreate()
        // Salva a instância para termos acesso como Singleton
        appInstance = this
    }

    companion object {
        // Singleton da classe Application
        private var appInstance: LivrosApplication? = null

        fun getInstance(): LivrosApplication {
            if (appInstance == null) {
                throw IllegalStateException(" lembrar **Configure a classe de Application no AndroidManifest.xml")
            }
            return appInstance!!
        }
    }

    // Chamado quando o Android finalizar o processo da aplicação
    override fun onTerminate() {
        super.onTerminate()
        Log.d(TAG, "LivrosApplication.onTerminate()")
    }
}
