import 'package:epastoral/screens/home/components/header_with_seachbox.dart';
import 'package:epastoral/views/user_list.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../constants.dart';
import 'Dashboard.dart';
import 'my_bottom_nav_bar.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigo,
        title: Text('Doar cestas '),
      ),

      backgroundColor: Colors.blueAccent,

      body: Container(
        child: Center(
          child: Column(
            children: <Widget>[
              HeaderWithSearchBox(size: size),
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Expanded(
                      child: RaisedButton(
                        highlightElevation: 50,
                        color: Colors.indigo,
                        child: Text('FAMILIARES',
                            style: TextStyle(color: Colors.white)),
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
                        color: Colors.indigo,
                        child: Text('CESTAS BÁSICAS',
                            style: TextStyle(color: Colors.white)),
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
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Expanded(
                    child: RaisedButton(
                      color: Colors.indigo,
                      child:
                          Text('EVENTOS', style: TextStyle(color: Colors.white)),
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
                      color: Colors.indigo,
                      child:
                          Text('VISITAS', style: TextStyle(color: Colors.white)),
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

      ),

    );
  }
}
