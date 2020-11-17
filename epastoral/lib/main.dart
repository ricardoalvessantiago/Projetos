import 'package:epastoral/provider/users.dart';
import 'package:epastoral/provider/widgetlogin.dart';
import 'package:epastoral/routes/app_routes.dart';

import 'package:epastoral/views/user_form.dart';
import 'package:epastoral/views/user_list.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (ctx) => Users(),
      child: MaterialApp(
        title: 'ePastoral',
        theme: ThemeData(
          primarySwatch: Colors.green,

          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home:UserList(),
        routes: {
          AppRoutes.WidgetLogin: (_) => WidgetLogin(),
          AppRoutes.UserList: (_) => UserList(),
          AppRoutes.USER_FORM: (_) => UserForm(),


        },
      ),
    );
  }
}


//Tela de Login
