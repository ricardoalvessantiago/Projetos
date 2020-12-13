import 'package:epastoral/views/relative_form.dart';
import 'package:flutter/material.dart';

class Validation extends StatelessWidget {
  final bool id = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal,
      body: Center(
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          decoration: BoxDecoration(
              border: Border.all(
            color: Colors.blue,
            width: 2,
          )),

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
                  child: Text('Familiar', style: TextStyle(
                    fontWeight: FontWeight.bold
                  ),),
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
                  child: Text('Cadastrante', style: TextStyle(
                    fontWeight: FontWeight.bold
                  ),),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
