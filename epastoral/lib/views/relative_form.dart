import 'package:flutter/material.dart';
import 'package:epastoral/models/relative.dart';
class RelativeForm extends StatelessWidget {
  final _form = GlobalKey<FormState>();
  final Map<String, Object> _formData = {};

  void _loadFormData(Relative relative) {
    if (relative != null) {
      _formData['id_Rel'] = relative.id_Rel;
      _formData['sobrenome'] = relative.sobrenome;
      _formData['rg'] = relative.email;
      _formData['cpf'] = relative.cpf;
      _formData['endereco'] = relative.endereco;
    }
  }

  @override
  Widget build(BuildContext context) {
    final Relative relative = ModalRoute.of(context).settings.arguments;
    _loadFormData(relative);
    
    return Container();
  }
}
