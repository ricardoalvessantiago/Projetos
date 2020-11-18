import 'package:epastoral/models/user.dart';
import 'package:flutter/cupertino.dart';


class Registrant extends User {
  final String id_Reg;
  final String nomeParoquia;

  const Registrant({
    this.id_Reg,
    @required this.nomeParoquia,

  });


}