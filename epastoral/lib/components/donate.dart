import 'package:epastoral/screens/home/components/header_with_seachbox.dart';
import 'package:epastoral/views/user_list.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'my_bottom_nav_bar.dart';

class Donate extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigo,
        title: Text('Donate'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          HeaderWithSearchBox(size: size),
          Text(
            'D O A R',
            style: TextStyle(
              color: Colors.blueAccent,
              fontSize: 23,
              fontWeight: FontWeight.bold,
            ),
          ),
          Row(
            children: [
              Expanded(
                child: Container(
                  padding: EdgeInsets.only(
                    top: 1,
                    left: 90,
                    right: 90,
                    bottom: 1,
                  ),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        colors: [
                          Colors.blueGrey[900],
                          Colors.blueGrey[700],
                          Colors.blueGrey[300]
                        ]),
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(36),
                      bottomRight: Radius.circular(36),
                    ),
                  ),
                  child: Card(
                    elevation: 5,
                    child: Image.asset(
                      'assets/images/doar.png',
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
              ),
            ],
          ),
          Container(
            height: 120,
            width: 400,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[

                   RaisedButton(
                    highlightElevation: 50,
                    color: Colors.indigo,
                    child: Text('Buscar na residencia',
                        style: TextStyle(color: Colors.white)),
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return UserList();
                      }));
                    },
                  ),

                Expanded(
                  child: RaisedButton(
                    color: Colors.indigo,
                    child:
                        Text('Locais de coleta', style: TextStyle(color: Colors.white)),
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
        ],
      ),
      bottomNavigationBar: MyBottomNavBar(),
    );
  }
}
