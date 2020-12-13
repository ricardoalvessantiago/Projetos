import 'package:epastoral/models/relative.dart';
import 'package:flutter/cupertino.dart';

class Basket {
  final String id;
  final String dtSolitacao;
  final String dtEntrega;
  final int Relative;
  final int Registrant;
  const Basket({
    this.id,
    @required this.dtSolitacao,
    @required this.dtEntrega,
    @required this.Relative,
    @required this.Registrant,
  });

}
