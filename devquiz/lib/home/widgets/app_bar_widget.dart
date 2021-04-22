import 'package:DevQuiz/core/app_gradients.dart';
import 'package:flutter/material.dart';

class AppBarWidget extends PreferredSize {
  AppBarWidget()
      : super(
          preferredSize: Size.fromHeight(250),
          child: Container(
            decoration: BoxDecoration(gradient: AppGradients.linear),
            child: Row(
              children: [
                Text("Olá, Ricardo Dev"),
                Container(
                  width: 200,
                  height: 200,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: NetworkImage(
                              "https://avatars.githubusercontent.com/u/28695175?s=60&v=4"))),
                )
              ],
            ),
          ),
        );
}
