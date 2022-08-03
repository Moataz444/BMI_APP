import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';

Future Navigato(context, widget) =>
    Navigator.push(context, MaterialPageRoute(builder: (context) => widget));

double bmiFunc({required int weight, required double height}) {
  double result = weight / pow(height / 100, 2);
  return result;
}

Widget gaugeText({required String txt}) {
  return Text(
    txt,
    style: const TextStyle(fontSize: 13),
  );
}

Widget textPointer({required String txt}) => SizedBox(
      height: 30,
      child: Column(
        children: [
          const Text(
            '|',
            style: TextStyle(fontSize: 8, fontWeight: FontWeight.bold),
          ),
          Text(txt),
        ],
      ),
    );

double checkResult(double result) {
  if (result > 43) {
    return 43;
  }
  if (result < 10) {
    return 10;
  } else {
    return result;
  }
}
