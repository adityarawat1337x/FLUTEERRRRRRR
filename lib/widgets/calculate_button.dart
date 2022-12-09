import 'package:flutter/material.dart';

import '../constants.dart';

class calculateButton extends StatelessWidget {
  calculateButton({this.run, this.label});
  final Function run;
  final String label;

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      child: Container(
        color: kPurple,
        height: 50,
        child: Center(
          child: GestureDetector(
            onTap: run,
            child: Text(
              label,
              textScaleFactor: 1.5,
            ),
          ),
        ),
      ),
    );
  }
}
