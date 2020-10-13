import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class Dashboard extends StatelessWidget {
  final  String folderPlay,  i;



  const Dashboard({Key key, this.folderPlay, this.i}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return
        CarouselSlider(
          options: CarouselOptions(
            height: 400.0,
            aspectRatio: 16 / 9,
            viewportFraction: 0.8,
            initialPage: 0,
            enlargeCenterPage: true,
            scrollDirection: Axis.horizontal,
            enableInfiniteScroll: true,
            reverse: false,
            autoPlay: true,
            autoPlayInterval: Duration(seconds: 3),
            autoPlayAnimationDuration: Duration(milliseconds: 500),
            autoPlayCurve: Curves.fastOutSlowIn,
          ),
          items: [
            Container(
                decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(18.0),
                image: DecorationImage(
                image: AssetImage('assets/images/$folderPlay/$i.jpg'),
              ),
            )),
          ],
        );
  }

}
