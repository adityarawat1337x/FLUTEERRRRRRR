import "package:flutter/material.dart";

class GenderIcon extends StatelessWidget {
  GenderIcon(
      {@required this.icon, @required this.title, @required this.colour});

  final IconData icon;
  final String title;
  final Color colour;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          icon,
          size: 80,
          color: colour,
        ),
        Center(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text(
              title,
              style: TextStyle(color: colour),
            ),
          ),
        ),
      ],
    );
  }
}
