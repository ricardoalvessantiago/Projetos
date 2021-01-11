package com.projetfull.startuspet.View

import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import android.widget.TextView
import androidx.recyclerview.widget.RecyclerView
import com.projetfull.startuspet.Model.Animal
import com.projetfull.startuspet.R
import kotlinx.android.synthetic.main.rvc_pets.view.*
//passa a vacina como parametros para preenchar o recycle também
class PetAdapter(var pets: MutableList<Animal>) : RecyclerView.Adapter<PetAdapter.PetHolder>() {


    override fun onCreateViewHolder(parent: ViewGroup, viewType: Int): PetHolder {
       val view = LayoutInflater.from(parent.context).inflate(R.layout.rvc_pets, parent, false)
        return PetHolder(view)
    }

    override fun onBindViewHolder(holder: PetHolder, position: Int) {
        val pets = pets.get(position)

        //Holdes ficticios somente para trazer as informações na tela, depois criar a relação entre
        //o pet e a vacina, data e local que o pet irá tomar a vacina
        holder.txtVacinaName.text = "Vacina: ${pets.nome}"
        holder.txtDataVacina.text = "Data da vacina: "
        holder.txtLocalVacina.text = "Local da Vacina:  Rua sei lá, N°"


    }

    override fun getItemCount(): Int {
        return pets.size
    }



    inner class PetHolder(view: View) : RecyclerView.ViewHolder(view) {
        var txtVacinaName: TextView
        var txtLocalVacina: TextView
        var txtDataVacina: TextView
        


        init {
            txtVacinaName = view.findViewById(R.id.txtVacinaName)
            txtLocalVacina = view.findViewById(R.id.txtLocalVacina)
            txtDataVacina = view.findViewById(R.id.txtDataVacina)
        }
    }
}
