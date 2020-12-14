import 'package:epastoral/components/Relative_tile.dart';
import 'package:epastoral/provider/relatives.dart';
import 'package:epastoral/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RelativeList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Relatives relatives = Provider.of(context);
    return Scaffold(
      appBar: AppBar(
          title: Text(
            "Familiares",
          ),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.add),
              onPressed: () {
                Navigator.of(context).pushNamed(AppRoutes.RelativeForm);
              },
            ),
          ]),
      body: ListView.builder(
        itemCount: relatives.count,
        itemBuilder: (ctx, i) => RelativeTile(relatives.byIndex(i)),
      ),
    );
  }
}
