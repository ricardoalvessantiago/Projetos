// import 'package:http/http.dart' as http;
// import 'dart:convert';

// Future main() async {
//   final marca = await fecth();
//   print(marca.id);
// }

// class Marca {
//   final String nome;
//   final String codigo;

//   Marca({this.nome, this.codigo});

//   factory Marca.fromJson(Map<String, dynamic> json) {
//     return Marca(
//       nome: json['nome'],
//       codigo: json['codigo'],
//     );
//   }

//   Future<Marca> fecth() async {
//     var url = Uri.parse('https://parallelum.com.br/fipe/api/v1/carros/marcas');
//     var response = await http.get(url);
//     var json = jsonDecode(response.body);
//     var marca = Marca.fromJson(json);

//     return marca;
//   }
// }
