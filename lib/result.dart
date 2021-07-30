import 'package:bmi_cal/constants.dart';
import 'package:bmi_cal/reusable_card.dart';
import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  Result({@required this.bmiData});

  final Map<String, String>? bmiData;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Result'),
      ),
      body: Column(
        children: [
          Expanded(
            child: ReusableCard(
              colour: activeCardColor,
              cardChild: Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      '${bmiData!['result']}',
                      style: globalTextStyle.copyWith(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Colors.greenAccent,
                      ),
                    ),
                    Text(
                      '${bmiData!['bmi']}',
                      style: inputNumberStyle.copyWith(
                        fontSize: 90,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 10, right: 10),
                      child: Text(
                        '${bmiData!['interpretation']}',
                        style: globalTextStyle,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
