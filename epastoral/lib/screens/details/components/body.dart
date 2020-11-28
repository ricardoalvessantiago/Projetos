import 'package:epastoral/components/HomePage.dart';
import 'package:epastoral/routes/app_routes.dart';
import 'package:epastoral/screens/home/components/header_with_seachbox.dart';
import 'package:flutter/material.dart';


import '../../../constants.dart';
import 'image_and_icons.dart';
import 'title_and_price.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[

          ImageAndIcons(size: size),
          TitleAndPrice(title: "Paróquia São João", country: "CURITBA", price: 000),
          SizedBox(height: kDefaultPadding),
          Row(
            children: <Widget>[
              SizedBox(
                width: size.width / 2,
                height: 84,
                child: FlatButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(20),
                    ),
                  ),
                  color: kPrimaryColor,
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                        builder: (context) => HomePage()),);
                  },
                  child: Text(
                    "CLIQUE PARA DOAR",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
              Expanded(
                child: FlatButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(20),
                    ),
                  ),
                  color: kTextColor
                  ,
                  onPressed: () {},
                  child: Text("Descrição"),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
