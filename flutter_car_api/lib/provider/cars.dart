import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_car_api/data/API.dart';
import 'package:http/http.dart' as http;

class Cars with ChangeNotifier {
  static const _baseUrl = 'https://parallelum.com.br/fipe/api/v1';
  // final Map<String, Api> _itens = {...CAR_TEST};

  // List<Api> get all {
  //   notifyListeners();
  //   return [..._itens.values];
  // }
  List<Api> loadedCars = [];

  Cars() {
    fetchCars();
  }

  Future<void> fetchCars() async {
    final response = await http
        .get(Uri.parse('https://parallelum.com.br/fipe/api/v1/carros/marcas'));
    final extractedData = json.decode(response.body) as Map<String, dynamic>;
    final List<Api> downloadedCars = [];
    extractedData.forEach((carID, carData) {
      downloadedCars.add(
        Api(
          codigo: carData['codigo'],
          nome: carData['nome'],
        ),
      );
      print("Car name: ${carData['name']} e id: $carID}");
    });
    loadedCars = downloadedCars;
    notifyListeners();
  }

  int get count {
    return loadedCars.length;
  }

  Api byIndex(int i) {
    return loadedCars.elementAt(i);
  }
  // int get count {
  //   return _itens.length;
  // }

  // Api byIndex(int i) {
  //   return _itens.values.elementAt(i);
  // }
}
