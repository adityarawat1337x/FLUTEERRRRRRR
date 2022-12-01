import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

void main() => runApp(
      MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          backgroundColor: Colors.black,
          body: MyApp(),
        ),
      ),
    );

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    void play(int id) async {
      final player = AudioPlayer();
      await player.play(AssetSource('note$id.wav'));
    }

    List colors = [
      Colors.red,
      Colors.orange,
      Colors.yellow,
      Colors.green,
      Colors.blue,
      Colors.indigo,
      Colors.purple
    ];

    Expanded generateButtons(int id) => Expanded(
          child: TextButton(
              onPressed: () {
                play(id);
              },
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(colors[id - 1]),
                  side: MaterialStateProperty.all(BorderSide(width: 3.0))),
              child: null),
        );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        generateButtons(1),
        generateButtons(2),
        generateButtons(3),
        generateButtons(4),
        generateButtons(5),
        generateButtons(6),
        generateButtons(7),
      ],
    );
  }
}
