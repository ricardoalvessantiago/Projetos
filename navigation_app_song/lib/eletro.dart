import 'package:flutter/material.dart';

import 'package:audioplayers/audio_cache.dart';
import 'package:audioplayers/audioplayers.dart';
import 'dashboard.dart';
import 'hiphop.dart';
import 'rock.dart';
import 'pop.dart';

class Eletro extends StatelessWidget {
  final player = AudioCache();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text('Eletro'),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            Dashboard(folderPlay: 'eletro',i:'1'),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                RaisedButton(
                  color: Colors.purple,
                  child: Text('Pop', style: TextStyle(color: Colors.green)),
                  onPressed: () {
                    player.play('pop.mp3');
                    Navigator.push(context, MaterialPageRoute(builder: (context){
                      return Pop();
                    }));
                  },
                ),
                Expanded(
                  child: RaisedButton(
                    color: Colors.black,
                    child: Text('Rock', style: TextStyle(color: Colors.green)),
                    onPressed: () {
                      player.clearCache();
                      player.play('rock.mp3');
                      Navigator.push(context, MaterialPageRoute(builder: (context){
                        return Rock();
                      }));
                    },
                  ),
                ),
                RaisedButton(
                  color: Colors.yellow,
                  child: Text('Hip Hop', style: TextStyle(color: Colors.black)),
                  onPressed: () {
                    player.clearCache();
                    player.play('hiphop.mp3');
                    Navigator.push(context, MaterialPageRoute(builder: (context){
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
