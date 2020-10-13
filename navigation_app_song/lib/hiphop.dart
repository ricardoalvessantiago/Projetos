import 'package:flutter/material.dart';

import 'package:audioplayers/audio_cache.dart';
import 'package:audioplayers/audioplayers.dart';
import 'dashboard.dart';
import 'eletro.dart';
import 'rock.dart';
import 'pop.dart';

class Hiphop extends StatelessWidget {
  final player = AudioCache();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.yellow,
        title: Text('Hip Hop'),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            Dashboard(folderPlay: 'hiphop',i:'1'),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  RaisedButton(
                    color: Colors.purple,
                    child: Text('Pop', style: TextStyle(color: Colors.yellow)),
                    onPressed: () {
                      player.play('pop.mp3');
                      Navigator.push(context, MaterialPageRoute(builder: (context) {
                        return Pop();
                      }));
                    },
                  ),
                  Expanded(
                    child: RaisedButton(
                      color: Colors.black,
                      child: Text('Rock', style: TextStyle(color: Colors.yellow)),
                      onPressed: () {
                        player.play('rock.mp3');
                        Navigator.push(context, MaterialPageRoute(builder: (context) {
                          return Rock();
                        }));
                      },
                    ),
                  ),
                  RaisedButton(
                    color: Colors.green,
                    child: Text('Eletro', style: TextStyle(color: Colors.white)),
                    onPressed: () {
                      player.play('eletro.mp3');
                      Navigator.push(context, MaterialPageRoute(builder: (context) {
                        return Eletro();
                      }));
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
