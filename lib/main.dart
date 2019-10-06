import 'dart:async';

import 'package:audioplayers/audio_cache.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

void main() => runApp(XylophoneApp());

class XylophoneApp extends StatelessWidget {
  final player = AudioCache();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[

              buildKey(color: Colors.red, noteName: 'C', noteNumber: 1),
              buildKey(color: Colors.orange, noteName: 'D', noteNumber: 2),
              buildKey(color: Colors.yellow, noteName: 'E', noteNumber: 3),
              buildKey(color: Colors.green, noteName: 'F', noteNumber: 4),
              buildKey(color: Colors.blue, noteName: 'G', noteNumber: 5),
              buildKey(color: Colors.indigo, noteName: 'A', noteNumber: 6),
              buildKey(color: Colors.purple, noteName: 'B', noteNumber: 7),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildKey({int noteNumber, String noteName, Color color}) {
    return Expanded(
      child: FlatButton(
        onPressed: () async => await playNote(noteNumber),
        color: color,
        textColor: Colors.white,
        child: RotatedBox(
          quarterTurns: 1,
          child: Text(
            noteName,
            style: TextStyle(),
          ),
        ),
      ),
    );
  }

  Future<AudioPlayer> playNote(int noteNumber) {
    return player.play('note$noteNumber.wav');
  }
}
