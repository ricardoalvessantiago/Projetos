package com.projetfull.mybook.activity

import android.graphics.Bitmap
import android.os.Bundle
import android.view.View
import android.webkit.WebView
import android.webkit.WebViewClient
import android.widget.ProgressBar
import androidx.swiperefreshlayout.widget.SwipeRefreshLayout
import br.com.livroandroid.carros.extensions.setupToolbar
import com.projetfull.mybook.R
import com.projetfull.mybook.R.color.*

class LivroOnLineActivity : BaseActivity() {

    var swipeToRefresh: SwipeRefreshLayout? = null
    private val URL_SOBRE = "https://sites.google.com/"
    var webview: WebView? = null
    var progress: ProgressBar? = null

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_livro_on_line)

        /* my toolbar */
        val actionBar = setupToolbar(R.id.toolbar)
        actionBar?.setDisplayHomeAsUpEnabled(true)

        webview = findViewById(R.id.webView)
        progress = findViewById(R.id.progress)

        /* load page*/
        setWebViewClient(webview)
        webview?.loadUrl(URL_SOBRE)

        swipeToRefresh = findViewById(R.id.swipeToRefresh)
        swipeToRefresh?.setOnRefreshListener {
            webview?.reload()
        }
        swipeToRefresh?.setColorSchemeResources(
            refresh_progress_1,
            refresh_progress_2,
            refresh_progress_3 )
    }

    private fun setWebViewClient(webView: WebView?){
        webView?.webViewClient = object : WebViewClient() {
            override fun onPageStarted(view: WebView?, url: String?, favicon: Bitmap?) {
                super.onPageStarted(view, url, favicon)

                progress?.visibility = View.INVISIBLE
            }

            override fun onPageFinished(view: WebView?, url: String?) {
                progress?.visibility = View.INVISIBLE

                swipeToRefresh?.isRefreshing = false
            }
        }
    }
}