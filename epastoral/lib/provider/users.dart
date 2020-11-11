import 'dart:math';

import 'package:epastoral/data/user_teste.dart';
import 'package:epastoral/models/user.dart';
import 'package:flutter/material.dart';



class Users with ChangeNotifier {
  final Map<String, User> _itens = {...USERS_TESTE};

  List<User> get all {
    return [..._itens.values];
  }

  int get count {
    return _itens.length;
  }

  User byIndex(int i) {
    return _itens.values.elementAt(i);
  }

  void put(User user){
    if(user==null){
      return;
    }
    final id=Random().nextDouble().toString();
    _itens.putIfAbsent(id, () => User(
      id: id,
      name: user.name,
      email: user.email,
      avatarUrl: user.avatarUrl,
    ));

    notifyListeners();
  }
}

