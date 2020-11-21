
import 'package:epastoral/models/registrant.dart';
import 'package:epastoral/models/relatives.dart';


import 'package:flutter/cupertino.dart';

class Basket {
  final String id;
  final String dtSolitacao;
  final String dtEntrega;
  final List<Relatives> Relatives;
  final List<Registrant> Registrant;
  const Basket({
    this.id,
    @required this.dtSolitacao,
    @required this.dtEntrega,
    @required this.Relatives,
    @required this.Registrant,
  });

}
