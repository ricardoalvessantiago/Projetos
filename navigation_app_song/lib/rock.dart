import 'package:flutter/material.dart';

import 'package:audioplayers/audio_cache.dart';
import 'package:audioplayers/audioplayers.dart';
import 'dashboard.dart';
import 'eletro.dart';
import 'hiphop.dart';
import 'pop.dart';

class Rock extends StatelessWidget {

  final player = AudioCache();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text('Rock'),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            Dashboard(folderPlay: 'rock', i: '1'),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                RaisedButton(
                  color: Colors.purple,
                  child: Text('Pop', style: TextStyle(color: Colors.green)),
                  onPressed: () {
                    player.play('pop.mp3');
                    Navigator.push(context, MaterialPageRoute(builder: (context) {
                      return Pop();
                    }));
                  },
                ),
                Expanded(
                  child: RaisedButton(
                    color: Colors.green,
                    child: Text('Eletro', style: TextStyle(color: Colors.yellow)),
                    onPressed: () {
                      player.play('eletro.mp3');
                      Navigator.push(context, MaterialPageRoute(builder: (context) {
                        return Eletro();
                      }));
                    },
                  ),
                ),
                RaisedButton(
                  color: Colors.yellow,
                  child: Text('Hip Hop', style: TextStyle(color: Colors.green)),
                  onPressed: () {
                    player.play('hiphop.mp3');
                    Navigator.push(context, MaterialPageRoute(builder: (context) {
                      return Hiphop();
                    }));
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
