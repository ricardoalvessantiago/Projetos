import 'dart:convert';
import 'package:epastoral/models/relative.dart';
import 'package:epastoral/models/user.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Relatives with  ChangeNotifier{
  static const _baseURL = 'https://crud-flutter-free.firebaseio.com/';

  List<Relative> loadedRelatives = [];

  Relatives(){
    fetchUsers();  }


  Future <void> fetchUsers() async{
    final response = await http.get(
        'https://crud-flutter-free.firebaseio.com/relatives.json'
    );
    final extractedData = json.decode(response.body) as Map<String, dynamic>;
    final List<Relative> downloadedUsers = [];
    extractedData.forEach((userID, userData) {
      downloadedUsers.add(
        Relative(
            /*id: userID,
            name: userData['name'],
            email: userData['email'],
            avatarUrl: userData['avatarUrl']*/
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

  User byIndex(int i) {
    return loadedRelatives.elementAt(i);
  }

  Future <void> put(Relative relative) async{
    if(relative==null){
      return;
    }
    if(relative.id != null &&
        relative.id.trim().isNotEmpty){
      print("http.patch");
      await http.patch(
          '$_baseURL/relatives/${relative.id}.json',
          body: json.encode({
            'name': relative.name,
            'email': relative.email,
            'avatarUrl': relative.avatarUrl,
          })
      );
    }else{
      print("http.post");
      final response = await http.post(
          '$_baseURL/relatives.json',
          body: json.encode({
            'name': relative.name,
            'email': relative.email,
            'avatarUrl': relative.avatarUrl,
          })
      );
    }
    fetchUsers();
    notifyListeners();
  }
  void remove(Relative relative){
    if(relative != null && relative.id != null){
      print("http.delete");
      http.delete(
          '$_baseURL/relatives/${relative.id}.json'
      );
      loadedRelatives.remove(relative);
      notifyListeners();
    }
  }

}