import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'hiphop.dart';
import 'rock.dart';
import 'pop.dart';
import 'eletro.dart';



void main() => runApp(MyApp());

class MyApp extends StatelessWidget {



  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        initialRoute: '/third',
        routes: {
          '/': (context) => Pop(),
          '/first': (context) => Rock(),
          '/second': (context) => Hiphop(),
          '/third' : (context) => Eletro(),
        }
    );
  }
}

