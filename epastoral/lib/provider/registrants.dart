import 'dart:convert';

import 'package:epastoral/models/registrant.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

class Registrants with ChangeNotifier {
  static const _baseURL = 'https://crud-flutter-free.firebaseio.com/';

  List<Registrant> loadedRegistrants = [];

  Registrants() {
    fetchUsers();
  }

  Future<void> fetchUsers() async {
    final response = await http
        .get('https://crud-flutter-free.firebaseio.com/registrants.json');
    final extractedData = json.decode(response.body) as Map<String, dynamic>;
    final List<Registrant> downloadedUsers = [];
    extractedData.forEach((userID, userData) {
      downloadedUsers.add(
        Registrant(
          id_Reg: userID,
          nomeParoquia: userData['nomeParoquia'],
        ),
      );
      print("Registrant name: ${userData['nomeParoquia']} e id: $userID}");
    });
    loadedRegistrants = downloadedUsers;
    notifyListeners();
  }

  List<Registrant> get all {
    return [...loadedRegistrants];
  }

  int get count {
    return loadedRegistrants.length;
  }

  Registrant byIndex(int i) {
    return loadedRegistrants.elementAt(i);
  }

  Future<void> put(Registrant registrant) async {
    if (registrant == null) {
      return;
    }
    if (registrant.id != null && registrant.id.trim().isNotEmpty) {
      print("http.patch");
      await http.patch('$_baseURL/registrants/${registrant.id}.json',
          body: json.encode({
            'name': registrant.name,
            'email': registrant.email,
            'avatarUrl': registrant.avatarUrl,
          }));
    } else {
      print("http.post");
      final response = await http.post('$_baseURL/registrants.json',
          body: json.encode({
            'name': registrant.name,
            'email': registrant.email,
            'avatarUrl': registrant.avatarUrl,
          }));
    }
    fetchUsers();
    notifyListeners();
  }

  void remove(Registrant registrant) {
    if (registrant != null && registrant.id != null) {
      print("http.delete");
      http.delete('$_baseURL/registrants/${registrant.id}.json');
      loadedRegistrants.remove(registrant);
      notifyListeners();
    }
  }
}
