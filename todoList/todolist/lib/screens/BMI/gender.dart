import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:swipeable_button_view/swipeable_button_view.dart';
import 'package:swipebuttonflutter/swipable_button.dart';
import 'package:todolist/screens/BMI/age_weight.dart';
import 'package:todolist/screens/BMI/gender_widget.dart';
import 'package:todolist/screens/BMI/height.dart';
import 'package:swipebuttonflutter/swipebuttonflutter.dart';
import 'package:todolist/screens/BMI/scoreScreen.dart';

class Gender extends StatefulWidget {
  const Gender({Key? key}) : super(key: key);

  @override
  State<Gender> createState() => _GenderState();
}

class _GenderState extends State<Gender> {
  int _gender = 0;
  int _height = 150;
  int _age = 30;
  int _weight = 50;
  bool _isFinished = false;
  double _bmiScore = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BMI Calculator'),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(20),
          child: Card(
            elevation: 12,
            shape: const RoundedRectangleBorder(),
            child: Column(
              children: [
                GendetWidget(
                  onChange: (genderVal) {
                    _gender = genderVal;
                  },
                ),
                HeightWidget(
                  onChange: (heightVal) {
                    _height = heightVal;
                  },
                ),
              Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    AgeWeight(
                      onChange: (ageVal) {
                        _age = ageVal;
                      },
                      title: "Age",
                      initValue: 30,
                      min: 0,
                      max: 100,
                    ),
                    AgeWeight(
                      onChange: (weightVal) {
                        _weight = weightVal;
                      },
                      title: "Weight(Kg)",
                      initValue: 50,
                      min: 0,
                      max: 200,
                    ),
                  ],
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 60, vertical: 20),
                  child: SwipeableButtonView(
                      isFinished: _isFinished,
                      onFinish: () async {
                        await goToScoreScreen(_bmiScore,_age);
                        setState(() {
                          _isFinished = false;
                        });
                      },
                      onWaitingProcess: () {
                        calculate();
                        Future.delayed(Duration(seconds: 1), () {
                          setState(() {
                            _isFinished = true;
                          });
                        });
                      },
                      activeColor: Colors.red,
                      buttonWidget: const Icon(
                        Icons.arrow_forward_rounded,
                        color: Colors.black,
                      ),
                      buttonText: "Calculate"),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  void calculate() {
    _bmiScore = _weight / pow(_height / 100, 2);
  }

  Future<void> goToScoreScreen(_bmiScore,_age) async {
    final route = MaterialPageRoute(
      builder: (context) => ScoreScreen(bmiScore:_bmiScore, age: _age,),
    );
    Navigator.push(context, route);
  }
}
