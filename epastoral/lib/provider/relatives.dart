import 'dart:convert';
import 'package:epastoral/models/relative.dart';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Relatives with ChangeNotifier {
  static const _baseURL = 'https://crud-flutter-free.firebaseio.com/';

  List<Relative> loadedRelatives = [];

  Relatives() {
    fetchUsers();
  }

  Future<void> fetchUsers() async {
    final response = await http
        .get('https://crud-flutter-free.firebaseio.com/relatives.json');
    final extractedData = json.decode(response.body) as Map<String, dynamic>;
    final List<Relative> downloadedUsers = [];
    extractedData.forEach((userID, userData) {
      downloadedUsers.add(
        Relative(
          id_Rel: userID,
          sobrenome: userData['sobrenome'],
          rg: userData['rg'],
          cpf: userData['cpf'],
          endereco: userData['endereco'],
        ),
      );
      print("Relative name: ${userData['name']} e id: $userID}");
    });
    loadedRelatives = downloadedUsers;
    notifyListeners();
  }

  List<Relative> get all {
    return [...loadedRelatives];
  }

  int get count {
    return loadedRelatives.length;
  }

  Relative byIndex(int i) {
    return loadedRelatives.elementAt(i);
  }

  Future<void> put(Relative relative) async {
    if (relative == null) {
      return;
    }
    if (relative.id_Rel != null && relative.id_Rel.trim().isNotEmpty) {
      print("http.patch");
      await http.patch('$_baseURL/relatives/${relative.id_Rel}.json',
          body: json.encode({
            'sobrenome': relative.sobrenome,
            'rg': relative.rg,
            'cpf': relative.cpf,
            'endereco': relative.endereco,
          }));
    } else {
      print("http.post");
      final response = await http.post('$_baseURL/relatives.json',
          body: json.encode({
            'sobrenome': relative.sobrenome,
            'rg': relative.rg,
            'cpf': relative.cpf,
            'endereco': relative.endereco,
          }));
    }
    //fetchUsers();
    notifyListeners();
  }

  void remove(Relative relative) {
    if (relative != null && relative.id_Rel != null) {
      print("http.delete");
      http.delete('$_baseURL/relatives/${relative.id_Rel}.json');
      loadedRelatives.remove(relative);
      notifyListeners();
    }
  }
}
