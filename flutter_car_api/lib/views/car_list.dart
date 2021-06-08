import 'package:flutter/material.dart';
import 'package:flutter_car_api/components/car_tile.dart';
import 'package:flutter_car_api/provider/cars.dart';
import 'package:provider/provider.dart';

class CarList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Cars cars = Provider.of(context);
    return (Scaffold(
      appBar: AppBar(
        title: Text("Lista de carros"),
      ),
      body: ListView.builder(
          itemCount: cars.count,
          itemBuilder: (ctx, i) => CarTile(cars.byIndex(i))),
    ));
  }
}
