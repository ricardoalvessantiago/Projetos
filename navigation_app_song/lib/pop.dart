import 'package:audioplayers/audio_cache.dart';
import 'package:flutter/material.dart';
import 'dashboard.dart';
import 'eletro.dart';
import 'hiphop.dart';
import 'rock.dart';

class Pop extends StatelessWidget {
  final player = AudioCache();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        title: Text('Rei do Pop'),
      ),
      body: Column(
        children: <Widget>[
          Dashboard(folderPlay: 'pop', i: '1'),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              RaisedButton(
                color: Colors.green,
                child: Text('Eletro', style: TextStyle(color: Colors.yellow)),
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return Eletro();
                  }));
                },
              ),
              Expanded(
                child: RaisedButton(
                  color: Colors.black,
                  child: Text('Rock', style: TextStyle(color: Colors.green)),
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) {
                      return Rock();
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
    );
  }
}
