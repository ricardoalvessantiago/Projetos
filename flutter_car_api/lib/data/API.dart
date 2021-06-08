import 'package:flutter/material.dart';

class Api {
  final String codigo;
  final String nome;

  const Api({
    this.codigo,
    @required this.nome,
  });

  // Api.fromJson(Map<String, dynamic> json) {
  //   nome = json['nome'];
  //   codigo = json['codigo'];
  // }

  // Map<String, dynamic> toJson() {
  //   final Map<String, dynamic> data = new Map<String, dynamic>();
  //   data['nome'] = this.nome;
  //   data['codigo'] = this.codigo;
  //   return data;
  // }
}
