import 'dart:convert';

import 'package:epastoral/routes/app_routes.dart';
import 'package:epastoral/views/user_form.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:share/share.dart';
import 'package:transparent_image/transparent_image.dart';

import 'Dashboard.dart';

class HomePage extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text('Pastoral -- HOME PAGE'),

      ),
      body: Center(
        child: Column(
          children: <Widget>[
            Dashboard(folderPlay: 'cestas',i:'1'),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[


                Expanded(
                  child: RaisedButton(
                    color: Colors.black,
                    child: Text('Home', style: TextStyle(color: Colors.green)),
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context){
                        return UserForm();
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