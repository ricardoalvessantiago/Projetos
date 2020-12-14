import 'package:epastoral/components/user_tile.dart';
import 'package:epastoral/provider/users.dart';
import 'package:epastoral/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class UserList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Users users = Provider.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Usuários do sistema"),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              Navigator.of(context).pushNamed(AppRoutes.USER_FORM);
            },
          ),
        ],
      ),
      body: ListView.builder(
          itemCount: users.count,
          itemBuilder: (ctx, i) => UserTile(users.byIndex(i)),
      ),
    );
  }
}
