import 'package:epastoral/components/donate.dart';
import 'package:epastoral/provider/relatives.dart';
import 'package:epastoral/provider/users.dart';
import 'package:epastoral/provider/widget_login.dart';
import 'package:epastoral/routes/app_routes.dart';
import 'package:epastoral/screens/home/home_screen.dart';
import 'package:epastoral/views/relative_form.dart';
import 'package:epastoral/views/relative_list.dart';
import 'package:epastoral/views/user_form.dart';
import 'package:epastoral/views/user_list.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'constants.dart';

void main() =>  runApp(MyApp());


class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<Relatives>.value(value: Relatives(),),
        ChangeNotifierProvider<Users>.value(value: Users(),),
      ],
      /*ChangeNotifierProvider(
      create: (ctx) => Users(),*/
      child: MaterialApp(
        title: 'ePastoral',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          scaffoldBackgroundColor: kBackgroundColor,
          primaryColor: Colors.indigo,
          textTheme: Theme.of(context).textTheme.apply(bodyColor: kTextColor),
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),

        home: WidgetLogin(),
        routes: {
          AppRoutes.WidgetLogin: (_) => WidgetLogin(),
          AppRoutes.HomeScreen: (_) => HomeScreen(),
          AppRoutes.UserList: (_) => UserList(),
          AppRoutes.RelativeList: (_) => RelativeList(),
          AppRoutes.USER_FORM: (_) => UserForm(),
          AppRoutes.RelativeForm: (_) => RelativeForm(),
          AppRoutes.Donate: (_) => Donate(),
        },//UserList(),

      ),
    );
  }
}

//Tela de Login
