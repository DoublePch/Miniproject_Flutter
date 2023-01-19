import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class HeightWidget extends StatefulWidget {
  final Function(int) onChange;
  const HeightWidget({Key? key, required this.onChange}) : super(key: key);

  @override
  State<HeightWidget> createState() => _HeightWidgetState();
}

class _HeightWidgetState extends State<HeightWidget> {
  int _height = 150;
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 12,
      shape: const RoundedRectangleBorder(),
      child: Column(
        children: [
          Text(
            "Height",
            style: TextStyle(fontSize: 25, color: Colors.black),
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                _height.toString(),
                style: TextStyle(fontSize: 40),
              ),
              SizedBox(width: 10),
              Text(
                "cm",
                style: TextStyle(fontSize: 20, color: Colors.grey),
              ),
            ],
          ),
          Slider(
            min: 0,
            max: 240,
            thumbColor: Colors.black,
            value: _height.toDouble(),
            onChanged: (value) {
              setState(() {
                _height = value.toInt();
              });
              widget.onChange(_height);
            },

          ),
        ],
      ),
    );
  }
}
