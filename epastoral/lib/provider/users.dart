import 'dart:convert';

import 'package:epastoral/models/user.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;



class Users with ChangeNotifier {
  static const _baseURL = 'https://crud-flutter-free.firebaseio.com/';
  List<User> loadedUsers = [];

  Users(){
    fetchUsers();
  }


  Future <void> fetchUsers() async{
    final response = await http.get(
      'https://crud-flutter-free.firebaseio.com/users.json'
    );
    final extractedData = json.decode(response.body) as Map<String, dynamic>;
    final List<User> downloadedUsers = [];
    extractedData.forEach((userID, userData) {
      downloadedUsers.add(
        User(
            id: userID,
            name: userData['name'],
            email: userData['mail'],
            avatarUrl: userData['avatarURL']
        ),
      );
      print("User name: ${userData['name']} e id $userID}");
    });
    loadedUsers = downloadedUsers;
    notifyListeners();
  }

  List<User> get all {
    return [...loadedUsers];
  }

  int get count {
    return loadedUsers.length;
  }

  User byIndex(int i) {
    return loadedUsers.elementAt(i);
  }

  Future <void> put(User user) async{
    if(user==null){
      return;
    }
    if(user.id != null &&
      user.id.trim().isEmpty){
      print("http.patch");
      await http.patch(
          '$_baseURL/users/${user.id}.json',
        body: json.encode({
          'name': user.name,
          'email': user.email,
          'avatarURL': user.avatarUrl,
        })
      );
    }else{
      print("http.post");
      final response = await http.post(
        '$_baseURL/users.json',
          body: json.encode({
           'name': user.name,
           'email': user.email,
           'avatarURL': user.avatarUrl,
      })
      );
    }
    fetchUsers();
    notifyListeners();
  }
  void remove(User user){
    if(user != null && user.id != null){
      print("http.delete");
      http.delete(
          '$_baseURL/users/${user.id}.json'
      );
      loadedUsers.remove(user);
      notifyListeners();
    }
  }


}

