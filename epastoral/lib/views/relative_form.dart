import 'package:epastoral/components/TakePictureScreen.dart';
import 'package:epastoral/provider/relatives.dart';
import 'package:flutter/material.dart';
import 'package:epastoral/models/relative.dart';
import 'package:path/path.dart';
import 'package:provider/provider.dart';

class RelativeForm extends StatelessWidget {
  final _form = GlobalKey<FormState>();
  final Map<String, Object> _formData = {};

  void _loadFormData(Relative relative) {
    if (relative != null) {

      _formData['id_Rel'] = relative.id_Rel;
      _formData['sobrenome'] = relative.sobrenome;
      _formData['rg'] = relative.rg;
      _formData['cpf'] = relative.cpf;
      _formData['endereco'] = relative.endereco;
    }
  }

  @override
  Widget build(BuildContext context) {
    final Relative relative = ModalRoute.of(context).settings.arguments;
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
                Provider.of<Relatives>(context, listen: false).put(
                  Relative(
                    id_Rel: _formData['id_Rel'],
                    sobrenome: _formData['sobrenome'],
                    rg: _formData['rg'],
                    cpf: _formData['cpf'],
                    endereco: _formData['endereco'],
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
