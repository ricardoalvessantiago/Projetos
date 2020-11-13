import 'package:epastoral/components/user_tile.dart';
import 'package:epastoral/data/user_teste.dart';
import 'package:flutter/material.dart';


class UserList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final users={...USERS_TESTE};
    return Scaffold(
      appBar: AppBar(
        title: Text("Lista de usuários"),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              Navigator.pushNamed(context, '/user-form');
            },
          ),
        ],
      ),
      body: ListView.builder(
          itemCount: users.length,
          itemBuilder: (ctx, i) => UserTile(users.values.elementAt(i)),
      ),
    );

  }
}
