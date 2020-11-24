import 'package:epastoral/views/user_list.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../constants.dart';
import 'Dashboard.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigo,
        title: Text('HOME PAGE '),
      ),
      backgroundColor: Colors.blueAccent,
      body: Container(
        child: Center(
          child: Column(
            children: <Widget>[
              Dashboard(folderPlay: 'cestas', i: '1'),
              Container(
                alignment: Alignment.center,
                margin: EdgeInsets.symmetric(horizontal: kDefaultPadding),
                padding: EdgeInsets.symmetric(horizontal: kDefaultPadding),
                height: 54,
                decoration: BoxDecoration(
                  color: Colors.blueAccent,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      offset: Offset(0, 10),
                      blurRadius: 50,
                      color: kPrimaryColor.withOpacity(0.23),
                    ),
                  ],
                ),
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
