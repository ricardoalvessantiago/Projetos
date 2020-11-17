import 'package:epastoral/models/user.dart';
import 'package:flutter/cupertino.dart';

class Relatives extends User {

  final String id_Rel;
  final String sobrenome;
  final String rg;
  final String cpf;
  final String endereco;



  const Relatives({
    this.id_Rel,
    @required this.sobrenome,
    @required this.rg,
    @required this.cpf,
    @required this.endereco
  });



}
