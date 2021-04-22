import 'package:epastoral/components/TakePictureScreen.dart';
import 'package:epastoral/models/registrant.dart';
import 'package:epastoral/provider/registrants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RegistranForm extends StatelessWidget {
  final _form = GlobalKey<FormState>();
  final Map<String, Object> _formData = {};

  void _loadFormData(Registrant registran) {
    if (registran != null) {

      _formData['id_Rel'] = registran.id_Reg;
      _formData['nome'] = registran.name;
      _formData['nomeParoquia'] = registran.nomeParoquia;
      _formData['avatar'] = registran.avatarUrl;
      _formData['email'] = registran.email;
    }
  }

  @override
  Widget build(BuildContext context) {
    final Registrant relative = ModalRoute.of(context).settings.arguments;
    _loadFormData(relative);

    return Scaffold(
      appBar: AppBar(
        title: Text("Preencha o cadastro"),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.save),
            onPressed: () {
              final isValid = _form.currentState.validate();
              if (isValid) {
                _form.currentState.save();
                Provider.of<Registrant>(context, listen: false).put(
                  Registrant(
                    id_Reg: _formData['id_Rel'],
                    nomeParoquia: _formData['nomeParoquia'],
                  /*  nome: _formData['rg'],
                    cpf: _formData['cpf'],
                    endereco: _formData['endereco'],*/
                  ),
                );

                Navigator.of(context).pop();
              }
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              child: Image.asset('images/cestas/2.png'),
              margin: const EdgeInsets.all(10.0),
              height: 215,
              decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.grey,
                    width: 3,
                  ),
                  borderRadius: BorderRadius.circular(20)),
            ),
            Container(
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.grey,
                  width: 1,
                ),
              ),
              child: IconButton(
                  icon: Icon(Icons.camera_alt),
                  color: Colors.black,
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => TakePictureScreen(camera: null),
                      ),
                    );
                  }),
            ),
            Padding(
                padding: EdgeInsets.all(15),
                child: Form(
                  key: _form,
                  child: Column(
                    children: <Widget>[
                      TextFormField(
                        initialValue: _formData['name'],
                        decoration: InputDecoration(labelText: 'Nome'),
                        validator: (value) {
                          if (value == null || value.isEmpty)
                            return 'Nome inválido!';
                          if (value.trim().length < 3)
                            return 'Nome muito pequeno';
                          return null;
                        },
                        onSaved: (value) => _formData['name'] = value,
                      ),
                      TextFormField(
                        initialValue: _formData['sobrenome'],
                        decoration: InputDecoration(labelText: 'Sobrenome'),
                        onSaved: (value) => _formData['sobrenome'] = value,
                      ),
                      TextFormField(
                        initialValue: _formData['rg'],
                        decoration: InputDecoration(labelText: 'R.G'),
                        onSaved: (value) => _formData['rg'] = value,
                      ),
                      TextFormField(
                        initialValue: _formData['cpf'],
                        decoration: InputDecoration(labelText: 'CPF'),
                        onSaved: (value) => _formData['cpf'] = value,
                      ),
                      TextFormField(
                        initialValue: _formData['endereco'],
                        decoration: InputDecoration(labelText: 'Endereço'),
                        onSaved: (value) => _formData['endereco'] = value,
                      ),
                    ],
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
