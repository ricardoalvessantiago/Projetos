import 'package:epastoral/models/user.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart';

class Relative extends User {
  final String id_Rel;
  final String sobrenome;
  final String rg;
  final String cpf;
  final String endereco;

  const Relative(
      {this.id_Rel,
      @required this.sobrenome,
      @required this.rg,
      @required this.cpf,
      @required this.endereco});
}
