import 'dart:math';

import 'package:flutter/material.dart';

Future Navigato(context, widget) =>
    Navigator.push(context, MaterialPageRoute(builder: (context) => widget));

double bmiFunc({required int weight, required double height}) {
  double result = weight / pow(height / 100, 2);
  return result;
}
