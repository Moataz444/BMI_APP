import 'dart:async';

import 'package:bmi_app/shared/components/components.dart';
import 'package:bmi_app/shared/styles/colors.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'bmi_result_screen.dart';

class BmiCalculator extends StatefulWidget {
  const BmiCalculator({Key? key}) : super(key: key);

  @override
  State<BmiCalculator> createState() => _BmiCalculatorState();
}

dynamic result;
bool isMale = true;
double height = 120;
int weight = 60;
int age = 20;
bool onlongprss = false;
Timer? timer;
var addRemovee = _BmiCalculatorState();

class _BmiCalculatorState extends State<BmiCalculator> {
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height -
        (MediaQuery.of(context).padding.top + kToolbarHeight);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: clr,
        centerTitle: true,
        title: const Text(
          'Bmi Calculator',
        ),
      ),
      body: SingleChildScrollView(
        child: SizedBox(
          height: 605 > screenHeight ? 605 : screenHeight,
          child: Column(
            children: [
              Expanded(
                flex: 5,
                child: SizedBox(
                  width: double.infinity,
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Row(
                      children: [
                        Expanded(
                          child: GestureDetector(
                            onTap: () {
                              setState(() {
                                isMale = true;
                                clr = blue;
                              });
                            },
                            child: Container(
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
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        Expanded(
                          child: GestureDetector(
                            onTap: () {
                              setState(() {
                                isMale = false;
                                clr = pink;
                              });
                            },
                            child: Container(
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
                        Slider(
                          inactiveColor: Colors.grey,
                          activeColor: clr,
                          value: height,
                          max: 250,
                          min: 20,
                          onChanged: (value) {
                            setState(() {
                              height = value;
                            });
                            // print(value.round());
                          },
                        )
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
                                Expanded(
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      GestureDetector(
                                        onLongPress: () {
                                          onlongprss = true;
                                          Future.delayed(
                                              const Duration(milliseconds: 300),
                                              () {
                                            if (onlongprss) {
                                              timer = Timer.periodic(
                                                  const Duration(
                                                      milliseconds: 150),
                                                  (timer) {
                                                setState(() {
                                                  weight <= 0
                                                      ? weight
                                                      : weight--;
                                                });
                                              });
                                            }
                                          });
                                        },
                                        onLongPressEnd: (LongPressEndDetails
                                            longPressEndDetails) {
                                          if (timer != null) {
                                            timer!.cancel();
                                          }
                                          onlongprss = false;
                                        },
                                        child: FloatingActionButton(
                                          onPressed: () {
                                            setState(() {
                                              weight <= 0 ? weight : weight--;
                                            });
                                          },
                                          backgroundColor: clr,
                                          mini: true,
                                          child: const Icon(Icons.remove),
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 15,
                                      ),
                                      GestureDetector(
                                        onLongPress: () {
                                          onlongprss = true;
                                          Future.delayed(
                                              const Duration(milliseconds: 300),
                                              () {
                                            if (onlongprss) {
                                              timer = Timer.periodic(
                                                  const Duration(
                                                      milliseconds: 150),
                                                  (timer) {
                                                setState(() {
                                                  weight++;
                                                });
                                              });
                                            }
                                          });
                                        },
                                        onLongPressEnd: (LongPressEndDetails
                                            longPressEndDetails) {
                                          if (timer != null) {
                                            timer!.cancel();
                                          }
                                          onlongprss = false;
                                        },
                                        child: FloatingActionButton(
                                          onPressed: () {
                                            setState(() {
                                              weight++;
                                            });
                                          },
                                          backgroundColor: clr,
                                          mini: true,
                                          child: const Icon(Icons.add),
                                        ),
                                      ),
                                    ],
                                  ),
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
                                Expanded(
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      GestureDetector(
                                        onLongPress: () {
                                          onlongprss = true;
                                          Future.delayed(
                                              const Duration(milliseconds: 300),
                                              () {
                                            if (onlongprss) {
                                              timer = Timer.periodic(
                                                  const Duration(
                                                      milliseconds: 150),
                                                  (timer) {
                                                setState(() {
                                                  age <= 0 ? age : age--;
                                                });
                                              });
                                            }
                                          });
                                        },
                                        onLongPressEnd: (LongPressEndDetails
                                            longPressEndDetails) {
                                          if (timer != null) {
                                            timer!.cancel();
                                          }
                                          onlongprss = false;
                                        },
                                        child: FloatingActionButton(
                                          onPressed: () {
                                            setState(() {
                                              age <= 0 ? age : age--;
                                            });
                                          },
                                          backgroundColor: clr,
                                          mini: true,
                                          child: const Icon(Icons.remove),
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 15,
                                      ),
                                      GestureDetector(
                                        onLongPress: () {
                                          onlongprss = true;
                                          Future.delayed(
                                              const Duration(milliseconds: 300),
                                              () {
                                            if (onlongprss) {
                                              timer = Timer.periodic(
                                                  const Duration(
                                                      milliseconds: 150),
                                                  (timer) {
                                                setState(() {
                                                  age++;
                                                });
                                              });
                                            }
                                          });
                                        },
                                        onLongPressEnd: (LongPressEndDetails
                                            longPressEndDetails) {
                                          if (timer != null) {
                                            timer!.cancel();
                                          }
                                          onlongprss = false;
                                        },
                                        child: FloatingActionButton(
                                          onPressed: () {
                                            setState(() {
                                              age++;
                                            });
                                          },
                                          backgroundColor: clr,
                                          mini: true,
                                          child: const Icon(Icons.add),
                                        ),
                                      ),
                                    ],
                                  ),
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
              Padding(
                padding: const EdgeInsets.only(
                  bottom: 20,
                  left: 20,
                  right: 20,
                ),
                child: Container(
                  width: double.infinity,
                  height: 50,
                  decoration: BoxDecoration(
                      color: clr,
                      borderRadius: BorderRadiusDirectional.circular(20)),
                  child: MaterialButton(
                    onPressed: () {
                      setState(() {
                        result = bmiFunc(
                          height: height,
                          weight: weight,
                        );
                        // print(result.round());
                      });
                      Navigato(context, const BmiResult());
                      // Navigator.push(
                      //     context,
                      //     MaterialPageRoute(
                      //         builder: (context) => const BmiResult()));
                    },
                    child: const Text(
                      'Calculate',
                      style: TextStyle(fontSize: 25, color: Colors.white),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
