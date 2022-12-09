import 'package:flutter/material.dart';
import 'package:mi_card/constants.dart';

class Button extends StatelessWidget {
  final IconData icon;
  final Function run;
  Button({this.icon, this.run});

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      elevation: 100,
      onPressed: () {
        run();
      },
      padding: EdgeInsets.all(7),
      child: Icon(icon),
      shape: CircleBorder(),
      fillColor: kPurple,
    );
  }
}
