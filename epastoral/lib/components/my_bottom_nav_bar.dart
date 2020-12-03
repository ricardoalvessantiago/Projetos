import 'package:epastoral/components/donate.dart';
import 'package:epastoral/screens/details/details_screen.dart';
import 'package:epastoral/views/user_form.dart';
import 'package:epastoral/views/user_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../constants.dart';

class MyBottomNavBar extends StatelessWidget {
  const MyBottomNavBar({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        left: kDefaultPadding * 2,
        right: kDefaultPadding * 2,
        bottom: kDefaultPadding,
      ),
      height: 80,
      decoration: BoxDecoration(
        gradient: LinearGradient(colors: [
          Colors.yellowAccent, Colors.yellow[200], Colors.yellow[300]
        ]),
        //color: Colors.white,
        boxShadow: [
          BoxShadow(
            offset: Offset(0, -10),
            blurRadius: 35,
            color: kPrimaryColor.withOpacity(0.38),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          IconButton(
            icon: SvgPicture.asset(
              "assets/icons/flower.svg",
              color: Colors.indigo,
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DetailsScreen(),
                ),
              );
            },
          ),
          IconButton(
            icon: SvgPicture.asset(
              "assets/icons/heart-icon.svg",
              color: Colors.indigo,
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Donate(),
                ),
              );
            },
          ),
          IconButton(
            icon: SvgPicture.asset(
              "assets/icons/user-icon.svg",
              color: Colors.indigo,
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => UserForm(),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
