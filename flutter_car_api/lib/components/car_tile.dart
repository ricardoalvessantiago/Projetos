import 'package:flutter/material.dart';
import 'package:flutter_car_api/data/API.dart';

class CarTile extends StatelessWidget {
  final Api car;
  const CarTile(this.car);

  @override
  Widget build(BuildContext context) {
    final avatar = CircleAvatar(child: Icon(Icons.car_rental));
    return ListTile(
      leading: avatar,
      title: Text("Cód: " + car.codigo),
      subtitle: Text("Veículo: " + car.nome),
      trailing: Container(
        width: 100,
        child: Row(
          children: [
            IconButton(
              icon: Icon(Icons.phone),
              color: Colors.yellow,
              onPressed: () {},
            ),
            IconButton(
              icon: Icon(Icons.whatshot),
              color: Colors.green,
              onPressed: () {},
            )
          ],
        ),
      ),
    );
  }
}
