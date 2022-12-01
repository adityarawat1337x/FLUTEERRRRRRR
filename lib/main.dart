import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
          title: Text("Dice"),
        ),
        backgroundColor: Colors.blue,
        body: MyApp(),
      ),
    ),
  );
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int leftNum = 1, rightNum = 1;
  change() {
    setState(() {
      leftNum = 1 + new Random().nextInt(6);
      rightNum = 1 + new Random().nextInt(6);
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        height: double.infinity,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextButton(
                    onPressed: () {
                      change();
                    },
                    child: Image.asset('images/dice$leftNum.png')),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextButton(
                    onPressed: () {
                      change();
                    },
                    child: Image.asset('images/dice$rightNum.png')),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
