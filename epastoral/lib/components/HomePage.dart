import 'package:epastoral/views/user_list.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'Dashboard.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigo,
        title: Text('Pastoral -- HOME PAGE '),
      ),
      backgroundColor: Colors.blueAccent,
      body: Center(
        child: Column(
          children: <Widget>[
            Dashboard(folderPlay: 'cestas', i: '1'),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Expanded(
                  child: RaisedButton(
                    highlightElevation: 50,
                    color: Colors.black,
                    child: Text('FAMILIARES',
                        style: TextStyle(color: Colors.indigo)),
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return UserList();
                      }));
                    },
                  ),
                ),
                Expanded(
                  child: RaisedButton(
                    color: Colors.lightBlueAccent,
                    child: Text('CESTAS BÁSICAS',
                        style: TextStyle(color: Colors.indigo)),
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return UserList();
                      }));
                    },
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Expanded(
                  child: RaisedButton(
                    color: Colors.lightBlueAccent,
                    child: Text('EVENTOS',
                        style: TextStyle(color: Colors.indigo)),
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                            return UserList();
                          }));
                    },
                  ),
                ),
                Expanded(
                  child: RaisedButton(
                    color: Colors.black,
                    child: Text('VISITAS',
                        style: TextStyle(color: Colors.indigo)),
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                            return UserList();
                          }));
                    },
                  ),
                ),
              ],
            ),

          ],
        ),
      ),
    );
  }
}