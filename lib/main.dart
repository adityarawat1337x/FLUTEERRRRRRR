import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.blueGrey,
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                backgroundImage: AssetImage('assets/adi.jpeg'),
                radius: 50,
              ),
              Text(
                'Aditya Rawat',
                style: TextStyle(
                    fontFamily: 'Monoton', fontSize: 30, color: Colors.white),
              ),
              Text(
                'FLUTTER DEVELOPER',
                style: TextStyle(
                    fontFamily: 'Baloo', letterSpacing: 2, color: Colors.white),
              ),
              SizedBox(
                width: 130,
                height: 20,
                child: Divider(color: Colors.grey[500]),
              ),
              Card(
                  margin: EdgeInsets.symmetric(vertical: 10, horizontal: 50),
                  color: Colors.white,
                  child: ListTile(
                    leading: Icon(
                      Icons.phone,
                      color: Colors.blueGrey,
                    ),
                    title: Text("+91 7454852198"),
                  )),
              Card(
                margin: EdgeInsets.symmetric(vertical: 10, horizontal: 50),
                color: Colors.white,
                child: ListTile(
                  leading: Icon(
                    Icons.mail,
                    color: Colors.blueGrey,
                  ),
                  title: Text("rkrawat98766@gmail.com"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
