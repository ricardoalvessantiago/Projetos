import 'package:epastoral/views/relative_form.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../constants.dart';
import 'dashboard.dart';

class Validation extends StatelessWidget {
  final bool id = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal,
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(35.0),
            child: Dashboard(
              folderPlay: 'cestas',
              i: '1',
            ),
          ),
          Text(
            "Eu sou ",
            style: TextStyle(
              color: Colors.lightBlueAccent,
              fontStyle: FontStyle.italic,
              fontSize: 50.0,
              shadows: [
                BoxShadow(
                  offset: Offset(0, 15),
                  blurRadius: 22,
                  color: kPrimaryColor.withOpacity(0.22),
                ),
                BoxShadow(
                  offset: Offset(-15, -15),
                  blurRadius: 2,
                  color: Colors.blueGrey,
                ),
              ],
            ),
          ),
          Container(
            alignment: Alignment.bottomCenter,
            margin: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.blue,
                width: 2,
              ),
            ),
            child: Row(
              children: <Widget>[
                Expanded(
                  child: RaisedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => RelativeForm(),
                        ),
                      );
                    },
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0)),
                    splashColor: Colors.grey,
                    child: Text(
                      'Familiar',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                Expanded(
                  child: RaisedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => RelativeForm(),
                        ),
                      );
                    },
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0)),
                    splashColor: Colors.blue,
                    child: Text(
                      'Parte do\n time',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
