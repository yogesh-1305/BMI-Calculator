import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
                  child: ReusableCard(
                    colour: Colors.black45,
                    cardChild: GenderCard(
                      gender: 'Male',
                      icon: FontAwesomeIcons.mars,
                    ),
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    colour: Colors.black45,
                    cardChild: GenderCard(
                      gender: 'Female',
                      icon: FontAwesomeIcons.venus,
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
                  child: ReusableCard(colour: Colors.black45, cardChild: null),
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReusableCard(colour: Colors.black45, cardChild: null),
                ),
                Expanded(
                  child: ReusableCard(colour: Colors.black45, cardChild: null),
                ),
              ],
            ),
          ),
          Container(
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
          )
        ],
      ),
    );
  }
}

class GenderCard extends StatelessWidget {
  GenderCard({@required this.gender, @required this.icon});

  final String? gender;
  final IconData? icon;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          icon,
          size: 80.0,
        ),
        SizedBox(height: 15.0),
        Text(
          '$gender',
          style: TextStyle(fontSize: 18.0),
        ),
      ],
    );
  }
}

class ReusableCard extends StatelessWidget {
  ReusableCard({@required this.colour, this.cardChild});

  final Color? colour;
  final Widget? cardChild;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: cardChild,
      margin: EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        color: colour,
        borderRadius: BorderRadius.circular(10.0),
      ),
    );
  }
}
