import 'package:epastoral/models/relative.dart';
import 'package:epastoral/provider/relatives.dart';
import 'package:epastoral/routes/app_routes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RelativeTile extends StatelessWidget {
  final Relative relative;

  const RelativeTile(this.relative);

  @override
  Widget build(BuildContext context) {
    final avatar = relative.avatarUrl == null || relative.avatarUrl.isEmpty
        ? CircleAvatar(child: Icon(Icons.person))
        : CircleAvatar(backgroundImage: NetworkImage(relative.avatarUrl));
    return ListTile(
      leading: avatar,
      title: Text(relative.sobrenome),
      subtitle: Text(relative.rg + relative.cpf),
      trailing: Container(
        width: 100,
        child: Row(
          children: <Widget>[
            IconButton(
                icon: Icon(Icons.edit),
                color: Colors.orange,
                onPressed: () {
                  Navigator.of(context).pushNamed(
                    AppRoutes.RelativeForm,
                    arguments: relative,
                  );
                }),
            IconButton(
              icon: Icon(Icons.delete),
              color: Colors.red,
              onPressed: () {
                Provider.of<Relatives>(context, listen: false).remove(relative);
              },
            )
          ],
        ),
      ),
    );
    ;
  }
}
