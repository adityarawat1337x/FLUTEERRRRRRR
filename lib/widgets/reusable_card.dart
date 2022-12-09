import 'package:flutter/material.dart';

class ReusableCard extends StatelessWidget {
  final Color colour;
  final Widget child;
  final Function run;
  ReusableCard({@required this.colour, this.child, this.run});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: run,
      child: Container(
        margin: EdgeInsets.all(10),
        child: child,
        decoration: BoxDecoration(
            color: colour, borderRadius: BorderRadius.circular(10)),
      ),
    );
  }
}
