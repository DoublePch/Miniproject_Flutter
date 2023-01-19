import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_3d_choice_chip/flutter_3d_choice_chip.dart';

class GendetWidget extends StatefulWidget {
  final Function(int) onChange;
  const GendetWidget({Key? key, required this.onChange}) : super(key: key);

  @override
  State<GendetWidget> createState() => _GendetWidgetState();
}

class _GendetWidgetState extends State<GendetWidget> {
  int _gender = 0;

  final ChoiceChip3DStyle selectedStyle = ChoiceChip3DStyle(
    topColor: Colors.grey,
    backColor: Colors.white,
    borderRadius: BorderRadius.circular(20),
  );
  final ChoiceChip3DStyle unSelectedStyle = ChoiceChip3DStyle(
    topColor: Colors.white,
    backColor: Colors.grey,
    borderRadius: BorderRadius.circular(20),
  );

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ChoiceChip3D(
            border: Border.all(color: Colors.grey),
            style: _gender == 1 ? selectedStyle : unSelectedStyle,
            onSelected: () {
              setState(() {
                _gender = 1;
              });
              widget.onChange(_gender);
            },
            onUnSelected: () {},
            selected: _gender == 1,
            child: Padding(
              padding: const EdgeInsets.all(4.0),
              child: Column(
                children: [
                  Image.asset(
                    "assets/man.png",
                    width: 50,
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  const Text(
                    "Male",
                    style: TextStyle(color: Colors.black),
                  ),
                ],
              ),
            )),
        SizedBox(
          width: 20,
        ),
        ChoiceChip3D(
            border: Border.all(color: Colors.grey),
            style: _gender == 2 ? selectedStyle : unSelectedStyle,
            onSelected: () {
              setState(() {
                _gender = 2;
              });
                widget.onChange(_gender);
            },
            onUnSelected: () {},
            selected: _gender == 2,
            child: Padding(
              padding: const EdgeInsets.all(4.0),
              child: Column(
                children: [
                  Image.asset(
                    "assets/girl.png",
                    width: 50,
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  const Text(
                    "Girl",
                    style: TextStyle(color: Colors.black),
                  ),
                ],
              ),
            ))
      ],
    );
  }
}
