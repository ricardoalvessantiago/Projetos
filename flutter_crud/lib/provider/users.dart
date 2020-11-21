import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_crud/data/users_teste.dart';
import 'package:flutter_crud/models/user.dart';

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

    if(user.id!=null &&
    user.id.trim().isNotEmpty &&
    _itens.containsKey(user.id)) {
      _itens.update(user.id, (_) => User(
        id : user.id,
        name : user.name,
        email : user.email,
        avatarUrl: user.avatarUrl,
      ));
    } else {
      final id = Random().nextDouble().toString();
      _itens.putIfAbsent(id, () =>
          User(
            id: id,
            name: user.name,
            email: user.email,
            avatarUrl: user.avatarUrl,
          ));
    }
    notifyListeners();
  }
  void remove(User user) {
    if(user!=null && user.id!=null) {
      _itens.remove(user.id);
      notifyListeners();
    }
  }

}



