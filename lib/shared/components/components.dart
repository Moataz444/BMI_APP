import 'dart:async';
import 'dart:math';

import 'package:bmi_app/modules/bmi_calculator_screen.dart';
import 'package:flutter/material.dart';

import '../styles/colors.dart';

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

Widget addRemoveButton({required Function() function, required bool addIcon}) {
  return GestureDetector(
    onLongPress: () {
      addRemovee.addRemovefunction(function: function);
      // addRemovefunction(function: function);
    },
    onLongPressEnd: (LongPressEndDetails longPressEndDetails) {
      if (timer != null) {
        timer!.cancel();
      }
      onlongprss = false;
    },
    child: FloatingActionButton(
      onPressed: () {
        function;
      },
      backgroundColor: clr,
      mini: true,
      child: addIcon ? const Icon(Icons.add) : const Icon(Icons.remove),
    ),
  );
}
