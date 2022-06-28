import 'dart:math';
import 'package:bmi_app/shared/components/components.dart';
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
Color clr = Colors.lightBlueAccent;

class _BmiCalculatorState extends State<BmiCalculator> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: clr,
        centerTitle: true,
        title: const Text(
          'Bmi Calculator',
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          height: 600,
          child: Column(
            children: [
              Expanded(
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
                                clr = Colors.blue;
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
                                clr = Colors.pink;
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
                          max: 240,
                          min: 40,
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
                                      FloatingActionButton(
                                        onPressed: () {
                                          setState(() {
                                            weight--;
                                          });
                                        },
                                        backgroundColor: clr,
                                        mini: true,
                                        child: const Icon(Icons.remove),
                                      ),
                                      const SizedBox(
                                        width: 15,
                                      ),
                                      FloatingActionButton(
                                        onPressed: () {
                                          setState(() {
                                            weight++;
                                          });
                                        },
                                        backgroundColor: clr,
                                        mini: true,
                                        child: const Icon(Icons.add),
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
                                      FloatingActionButton(
                                        onPressed: () {
                                          setState(() {
                                            age--;
                                          });
                                        },
                                        backgroundColor: clr,
                                        mini: true,
                                        child: const Icon(Icons.remove),
                                      ),
                                      const SizedBox(
                                        width: 15,
                                      ),
                                      FloatingActionButton(
                                        onPressed: () {
                                          setState(() {
                                            age++;
                                          });
                                        },
                                        backgroundColor: clr,
                                        mini: true,
                                        child: const Icon(Icons.add),
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
                  height: 60,
                  decoration: BoxDecoration(
                      color: clr,
                      borderRadius: BorderRadiusDirectional.circular(20)),
                  child: MaterialButton(
                    onPressed: () {
                      setState(() {
                        result = weight / pow(height / 100, 2);
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
