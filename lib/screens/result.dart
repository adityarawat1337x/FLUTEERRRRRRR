import 'package:flutter/material.dart';
import 'package:mi_card/constants.dart';
import 'package:mi_card/widgets/reusable_card.dart';

import '../widgets/calculate_button.dart';

class Result extends StatelessWidget {
  final String result, bmi, interpretation;

  Result({this.result, this.interpretation, this.bmi});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: Container(
              padding: EdgeInsets.all(15),
              child: Text(
                "Your Result",
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 40),
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: ReusableCard(
              colour: kNotSelectedColour,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    result,
                    style: TextStyle(
                        fontWeight: FontWeight.w600,
                        color: Colors.green,
                        fontSize: 25),
                  ),
                  Center(
                    child: Text(
                      bmi,
                      style:
                          TextStyle(fontWeight: FontWeight.w800, fontSize: 90),
                    ),
                  ),
                  Text(
                    interpretation,
                    textAlign: TextAlign.center,
                    style: TextStyle(fontWeight: FontWeight.w400, fontSize: 20),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: calculateButton(
        run: () {
          Navigator.pop(context);
        },
        label: 'RE-CALCULATE',
      ),
    );
  }
}
