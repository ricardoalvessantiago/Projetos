import 'package:flutter/material.dart';
import 'package:flutter_car_api/provider/cars.dart';
import 'package:flutter_car_api/routes/app_routes.dart';
import 'package:flutter_car_api/views/car_form.dart';
import 'package:flutter_car_api/views/car_list.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (ctx) => Cars(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Api car ',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: CarList(),
        routes: {
          AppRoutes.USER_FORM: (_) => CarForm(),
        }, //HomePage(),// parte em teste ainda, substituir a classe home:
      ),
    );
  }
}

// class HomePage extends StatefulWidget {
//   HomePage({Key key}) : super(key: key);

//   @override
//   _HomePageState createState() => _HomePageState();
// }

// List<Api> _api = [];
// bool visual = false;

// Future<List<Api>> _getUser() async {
//   try {
//     List<Api> listUser = [];
//     var url = Uri.parse('https://parallelum.com.br/fipe/api/v1/carros/marcas');
//     final response = await http.get(url);
//     if (response.statusCode == 200) {
//       var descondeJson = jsonDecode(response.body);
//       //descondeJson.forEach((item) => listUser.add(Api.fromJson(item)));
//       return listUser;
//     } else {
//       print("Error ao Carregar Lista");
//     }
//   } catch (e) {
//     print("Error ao Carregar Lista");
//     return null;
//   }
// }

// @override
// void initState() {
//   // ignore: unnecessary_statements
//   _getUser().then((map) {
//     _api = map;
//     //print(_api.length);
//   });
// }

// class _HomePageState extends State<HomePage> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SafeArea(
//         child: ListView.builder(
//           itemCount: _api.length,
//           itemBuilder: (BuildContext context, int index) {
//             return Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: Container(
//                 height: 80,
//                 color: Colors.blue,
//               ),
//             );
//           },
//         ),
//       ),
//     );
//   }

// }
