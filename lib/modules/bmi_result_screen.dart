import 'package:bmi_app/modules/bmi_calculator_screen.dart';
import 'package:bmi_app/shared/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

import '../shared/components/components.dart';

class BmiResult extends StatelessWidget {
  const BmiResult({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height -
        (MediaQuery.of(context).padding.top + kToolbarHeight);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: clr,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back_ios_outlined)),
        centerTitle: true,
        title: const Text(
          'Bmi Result',
        ),
      ),
      body: SingleChildScrollView(
        child: SizedBox(
          height: 605 > screenHeight ? 605 : screenHeight,
          // 603,
          child: Column(
            children: [
              Expanded(
                flex: 5,
                child: SizedBox(
                  width: double.infinity,
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: isMale
                        ? Container(
                            decoration: BoxDecoration(
                                color: isMale ? clr : Colors.grey[400],
                                borderRadius:
                                    BorderRadiusDirectional.circular(20)),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: const [
                                Image(
                                  image: AssetImage('images/male.png'),
                                  height: 90,
                                  width: 90,
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                Text(
                                  'Male',
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                )
                              ],
                            ),
                          )
                        : Container(
                            decoration: BoxDecoration(
                                color: !isMale ? clr : Colors.grey[400],
                                borderRadius:
                                    BorderRadiusDirectional.circular(20)),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: const [
                                Image(
                                  image: AssetImage('images/female.png'),
                                  height: 90,
                                  width: 90,
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                Text(
                                  'Female',
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                )
                              ],
                            ),
                          ),
                  ),
                ),
              ),
              Expanded(
                flex: 4,
                child: Padding(
                  padding: const EdgeInsets.only(
                    bottom: 20,
                    left: 20,
                    right: 20,
                  ),
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.grey[400],
                        borderRadius: BorderRadiusDirectional.circular(20)),

                    width: double.infinity,
                    // color: Colors.black,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'Height',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.baseline,
                          textBaseline: TextBaseline.alphabetic,
                          children: [
                            Text(
                              '${height.round()}',
                              style: const TextStyle(fontSize: 55),
                            ),
                            const Text(
                              'cm',
                              style: TextStyle(fontSize: 20),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 4,
                child: Padding(
                  padding: const EdgeInsets.only(
                    bottom: 20,
                    left: 20,
                    right: 20,
                  ),
                  child: SizedBox(
                    width: double.infinity,
                    child: Row(
                      children: [
                        Expanded(
                          child: Container(
                            decoration: BoxDecoration(
                                color: Colors.grey[400],
                                borderRadius:
                                    BorderRadiusDirectional.circular(20)),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Text(
                                  'Weight',
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment:
                                      CrossAxisAlignment.baseline,
                                  textBaseline: TextBaseline.alphabetic,
                                  children: [
                                    Text(
                                      '$weight',
                                      style: const TextStyle(
                                          fontSize: 50,
                                          fontWeight: FontWeight.w600),
                                    ),
                                    const Text(
                                      'kg',
                                      style: TextStyle(fontSize: 20),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        Expanded(
                          child: Container(
                            decoration: BoxDecoration(
                                color: Colors.grey[400],
                                borderRadius:
                                    BorderRadiusDirectional.circular(20)),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Text(
                                  'Age',
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment:
                                      CrossAxisAlignment.baseline,
                                  textBaseline: TextBaseline.alphabetic,
                                  children: [
                                    Text(
                                      '$age',
                                      style: const TextStyle(
                                          fontSize: 50,
                                          fontWeight: FontWeight.w600),
                                    ),
                                    const Text(
                                      'yrs',
                                      style: TextStyle(fontSize: 20),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              // Padding(
              //   padding: const EdgeInsets.only(
              //     bottom: 20,
              //     left: 20,
              //     right: 20,
              //   ),
              //   child: Container(
              //     width: double.infinity,
              //     height: 60,
              //     decoration: BoxDecoration(
              //         color: clr,
              //         borderRadius: BorderRadiusDirectional.circular(20)),
              //     child: Center(
              //       child: Text(
              //         'Result: ${double.parse(result.toStringAsFixed(2))}',
              //         style: const TextStyle(
              //             fontSize: 24, fontWeight: FontWeight.bold),
              //       ),
              //     ),
              //   ),
              // ),
              SfLinearGauge(
                minimum: 10.0,
                maximum: 43.0,
                // interval: 16,
                // labelPosition: LinearLabelPosition.inside,
                // labelOffset: 0.1,
                showLabels: false,
                orientation: LinearGaugeOrientation.horizontal,
                majorTickStyle: const LinearTickStyle(length: 0),
                minorTickStyle: const LinearTickStyle(length: 0),
                axisLabelStyle:
                    const TextStyle(fontSize: 18.0, color: Colors.black),
                axisTrackStyle: const LinearAxisTrackStyle(
                  // color: Colors.cyan,
                  // edgeStyle: LinearEdgeStyle.bothFlat,
                  thickness: 0,
                  // borderColor: Colors.grey
                ),
                markerPointers: [
                  LinearShapePointer(
                    value: checkResult(result),
                    color: Colors.black.withOpacity(0.83),
                    shapeType: LinearShapePointerType.diamond,
                    height: 30,
                  ),
                  LinearWidgetPointer(
                    value: checkResult(result),
                    offset: 25,
                    position: LinearElementPosition.inside,
                    child: Wrap(
                      children: [
                        Text(
                          '${result.round()} kg/m',
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const Text(
                          '2',
                          style: TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                  LinearWidgetPointer(
                    enableAnimation: false,
                    value: 14.25,
                    offset: 30,
                    position: LinearElementPosition.outside,
                    child: gaugeText(txt: 'UnderWeight'),
                  ),
                  LinearWidgetPointer(
                    enableAnimation: false,
                    value: 21.75,
                    offset: 30,
                    position: LinearElementPosition.outside,
                    child: gaugeText(txt: 'Normal'),
                  ),
                  LinearWidgetPointer(
                    enableAnimation: false,
                    value: 30,
                    offset: 30,
                    position: LinearElementPosition.outside,
                    child: gaugeText(txt: 'OverWeight'),
                  ),
                  LinearWidgetPointer(
                    enableAnimation: false,
                    value: 39,
                    offset: 30,
                    position: LinearElementPosition.outside,
                    child: gaugeText(txt: 'Obesity'),
                  ),
                  LinearWidgetPointer(
                    enableAnimation: false,
                    value: 16,
                    // offset: 30,
                    position: LinearElementPosition.inside,
                    child: textPointer(txt: '16'),
                  ),
                  LinearWidgetPointer(
                    enableAnimation: false,
                    value: 18.5,
                    // offset: 30,
                    position: LinearElementPosition.inside,
                    child: textPointer(txt: '18.5'),
                  ),
                  LinearWidgetPointer(
                    enableAnimation: false,
                    value: 25,
                    // offset: 30,
                    position: LinearElementPosition.inside,
                    child: textPointer(txt: '25'),
                  ),
                  LinearWidgetPointer(
                    enableAnimation: false,
                    value: 30,
                    // offset: 30,
                    position: LinearElementPosition.inside,
                    child: textPointer(txt: '30'),
                  ),
                  LinearWidgetPointer(
                    enableAnimation: false,
                    value: 35,
                    // offset: 30,
                    position: LinearElementPosition.inside,
                    child: textPointer(txt: '35'),
                  ),
                  LinearWidgetPointer(
                    enableAnimation: false,
                    value: 40,
                    // offset: 30,
                    position: LinearElementPosition.inside,
                    child: textPointer(txt: '40'),
                  ),
                ],
                ranges: <LinearGaugeRange>[
                  LinearGaugeRange(
                      edgeStyle: LinearEdgeStyle.startCurve,
                      startValue: 10,
                      endValue: 16,
                      color: Colors.red,
                      startWidth: 30,
                      endWidth: 30,
                      child: Container(
                        // clipBehavior: Clip.antiAliasWithSaveLayer,
                        decoration: const BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadiusDirectional.only(
                            topStart: Radius.circular(10),
                            bottomStart: Radius.circular(10),
                          ),
                        ),
                      )),
                  LinearGaugeRange(
                      startValue: 16,
                      endValue: 17,
                      color: Colors.redAccent.withOpacity(0.7),
                      startWidth: 30,
                      endWidth: 30),
                  const LinearGaugeRange(
                      startValue: 17,
                      endValue: 18.5,
                      color: Colors.yellow,
                      startWidth: 30,
                      endWidth: 30),
                  const LinearGaugeRange(
                      startValue: 18.5,
                      endValue: 25,
                      color: Colors.green,
                      startWidth: 30,
                      endWidth: 30),
                  const LinearGaugeRange(
                      startValue: 25,
                      endValue: 30,
                      color: Colors.yellow,
                      startWidth: 30,
                      endWidth: 30),
                  LinearGaugeRange(
                      startValue: 30,
                      endValue: 35,
                      color: Colors.redAccent.withOpacity(0.7),
                      startWidth: 30,
                      endWidth: 30),
                  const LinearGaugeRange(
                      startValue: 35,
                      endValue: 40,
                      color: Colors.red,
                      startWidth: 30,
                      endWidth: 30),
                  LinearGaugeRange(
                      edgeStyle: LinearEdgeStyle.endCurve,
                      startValue: 40,
                      endValue: 43,
                      startWidth: 30,
                      endWidth: 30,
                      child: Container(
                        // clipBehavior: Clip.antiAliasWithSaveLayer,
                        decoration: BoxDecoration(
                          color: Colors.red.shade900,
                          borderRadius: const BorderRadiusDirectional.only(
                            topEnd: Radius.circular(10),
                            bottomEnd: Radius.circular(10),
                          ),
                        ),
                      )),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
