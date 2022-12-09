import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mi_card/bmi_calculator.dart';
import 'package:mi_card/screens/result.dart';
import 'package:mi_card/widgets/button.dart';
import 'package:mi_card/widgets/calculate_button.dart';
import 'package:mi_card/widgets/icon_content.dart';
import 'package:mi_card/widgets/reusable_card.dart';

import '../constants.dart';

enum Gender { male, female }

enum Metric { weight, age }

class InputPage extends StatefulWidget {
  const InputPage({Key key}) : super(key: key);

  @override
  State<InputPage> createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender gender;
  int height = 180, weight = 40, age = 16;
  double bmi;

  increment(value) {
    setState(() {
      value == Metric.age ? age++ : weight++;
    });
  }

  decrement(value) {
    setState(() {
      value == Metric.age ? age-- : weight--;
    });
  }

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
            child: Row(
              children: [
                Expanded(
                  child: ReusableCard(
                    run: () {
                      setState(
                        () {
                          gender = Gender.male;
                        },
                      );
                    },
                    colour: gender == Gender.male
                        ? kSelectedColour
                        : kNotSelectedColour,
                    child: GenderIcon(
                      title: 'MALE',
                      icon: FontAwesomeIcons.mars,
                      colour: gender == Gender.male ? kPurple : kWhite,
                    ),
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    run: () {
                      setState(
                        () {
                          gender = Gender.female;
                        },
                      );
                    },
                    colour: gender == Gender.female
                        ? kSelectedColour
                        : kNotSelectedColour,
                    child: GenderIcon(
                      title: 'FEMALE',
                      icon: FontAwesomeIcons.venus,
                      colour: gender == Gender.female ? kPurple : kWhite,
                    ),
                  ),
                )
              ],
            ),
          ),
          Expanded(
            child: ReusableCard(
              colour: kNotSelectedColour,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.all(20),
                    child: Text(
                      'HEIGHT',
                    ),
                  ),
                  Text(
                    '$height cm',
                    style: kNumberStyle,
                  ),
                  Slider(
                    activeColor: kPurple,
                    value: height.toDouble(),
                    min: 10,
                    max: 300,
                    onChanged: (newValue) {
                      setState(
                        () {
                          height = newValue.toInt();
                        },
                      );
                    },
                  )
                ],
              ),
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReusableCard(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: EdgeInsets.all(10),
                          child: Text(
                            'WEIGHT',
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Text(
                            '$weight',
                            style: kNumberStyle,
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Button(
                              icon: FontAwesomeIcons.minus,
                              run: () {
                                decrement(Metric.weight);
                              },
                            ),
                            Button(
                              icon: FontAwesomeIcons.plus,
                              run: () {
                                increment(Metric.weight);
                              },
                            ),
                          ],
                        )
                      ],
                    ),
                    colour: kNotSelectedColour,
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: EdgeInsets.all(10),
                          child: Text(
                            'AGE',
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Text(
                            '$age',
                            style: kNumberStyle,
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Button(
                              icon: FontAwesomeIcons.minus,
                              run: () {
                                decrement(Metric.age);
                              },
                            ),
                            Button(
                              icon: FontAwesomeIcons.plus,
                              run: () {
                                increment(Metric.age);
                              },
                            ),
                          ],
                        )
                      ],
                    ),
                    colour: kNotSelectedColour,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: calculateButton(
        run: () {
          CalculatorBrain ans = CalculatorBrain(weight: weight, height: height);

          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => Result(
                bmi: ans.calculateBMI(),
                result: ans.getResult(),
                interpretation: ans.getInterpretation(),
              ),
            ),
          );
        },
        label: 'CALCULATE',
      ),
    );
  }
}
