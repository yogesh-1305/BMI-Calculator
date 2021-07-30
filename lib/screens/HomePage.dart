import 'package:bmi_cal/calculator/Calculator.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../components/circle_button.dart';
import '../components/gender_card.dart';
import '../components/reusable_card.dart';
import '../constants/constants.dart';
import 'result.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var colorMale = activeCardColor;
  var colorFemale = inactiveCardColor;
  var gender = 1; // 1 == male | 2 == female
  var height = 180;
  var age = 22;
  var weight = 60;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        colorMale = activeCardColor;
                        colorFemale = inactiveCardColor;
                        gender = 1;
                      });
                    },
                    child: ReusableCard(
                      colour: colorMale,
                      cardChild: GenderCard(
                        gender: 'Male',
                        icon: FontAwesomeIcons.mars,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        colorFemale = activeCardColor;
                        colorMale = inactiveCardColor;
                        gender = 2;
                      });
                    },
                    child: ReusableCard(
                      colour: colorFemale,
                      cardChild: GenderCard(
                        gender: 'Female',
                        icon: FontAwesomeIcons.venus,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReusableCard(
                    colour: Colors.black45,
                    cardChild: Column(
                      children: [
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          'Height',
                          style: globalTextStyle,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.baseline,
                          textBaseline: TextBaseline.alphabetic,
                          children: [
                            Text(
                              height.toString(),
                              style: inputNumberStyle,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              'cm',
                              style: inputNumberStyle.copyWith(
                                fontSize: 14,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Slider(
                          value: height.toDouble(),
                          min: 120.0,
                          max: 220.0,
                          activeColor: Colors.red,
                          onChanged: (double newValue) {
                            setState(() {
                              height = newValue.round();
                            });
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReusableCard(
                    colour: activeCardColor,
                    cardChild: Column(
                      children: [
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          'Age (years)',
                          style: globalTextStyle,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          '$age',
                          style: inputNumberStyle,
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: CircularButton(
                                icon: FontAwesomeIcons.minus,
                                function: () {
                                  setState(
                                    () {
                                      age--;
                                    },
                                  );
                                },
                              ),
                            ),
                            Expanded(
                              child: CircularButton(
                                icon: FontAwesomeIcons.plus,
                                function: () {
                                  setState(
                                    () {
                                      age++;
                                    },
                                  );
                                },
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                      colour: Colors.black45,
                      cardChild: Column(
                        children: [
                          SizedBox(
                            height: 20,
                          ),
                          Text(
                            'Weight (in kg)',
                            style: globalTextStyle,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            '$weight',
                            style: inputNumberStyle,
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: CircularButton(
                                  icon: FontAwesomeIcons.minus,
                                  function: () {
                                    setState(
                                      () {
                                        weight--;
                                      },
                                    );
                                  },
                                ),
                              ),
                              Expanded(
                                child: CircularButton(
                                  icon: FontAwesomeIcons.plus,
                                  function: () {
                                    setState(
                                      () {
                                        weight++;
                                        print('plus');
                                      },
                                    );
                                  },
                                ),
                              ),
                            ],
                          ),
                        ],
                      )),
                ),
              ],
            ),
          ),
          GestureDetector(
            onTap: () {
              Calculator calc = Calculator(height: height, weight: weight);
              var bmi = calc.calculateBMI();
              var resultString = calc.getResult();
              var interpretation = calc.getInterpretation();

              Map<String, String> bmiData = {
                'bmi': bmi,
                'result': resultString,
                'interpretation': interpretation,
              };

              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Result(bmiData: bmiData),
                ),
              );
            },
            child: Container(
              color: Colors.red,
              margin: EdgeInsets.only(top: 10.0),
              width: double.infinity,
              height: 70.0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Calculate',
                    style: TextStyle(fontSize: 20.0),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
