import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import 'theme/theme.dart';

class CalculatorApp extends StatelessWidget {
  const CalculatorApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Windows Calculator App',
      theme: theme,
      home: const CalculatorHomePage(title: 'Calculator'),
    );
  }
}

class CalculatorHomePage extends StatefulWidget {
  const CalculatorHomePage({super.key, required this.title});

  final String title;

  @override
  State<CalculatorHomePage> createState() => _CalculatorHomePageState();
}

class _CalculatorHomePageState extends State<CalculatorHomePage> {
  
  String previousCalculations = "";
  String op = "";
  String calculations = "0";
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 40,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 35),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  "$previousCalculations $op",
                  style: Theme.of(context).textTheme.bodySmall
                )
              ]
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 105),
                child: Text(
                  maxLines: 1,
                  calculations,
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
              )
            ]
          ),
          Flexible(
            fit: FlexFit.tight,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Flexible(fit: FlexFit.tight, child: Padding(
                  padding: const EdgeInsets.all(1.0),
                  child: IconButton(
                    icon: const Icon(IconData(0xE94C, fontFamily: 'icons'), size: 18),
                    onPressed: () {},
                    style: GetIt.I<ButtonsStyleFactory>().buildButtonOperatorStyle(),
                  ),
                )),
                Flexible(fit: FlexFit.tight, child: Padding(
                  padding: const EdgeInsets.all(1.0),
                  child: TextButton(
                    onPressed: () {
                      setState(() {
                        calculations = "0";
                      });
                    },
                    style: GetIt.I<ButtonsStyleFactory>().buildButtonOperatorStyle(),
                    child: Text("CE", style: Theme.of(context).textTheme.bodyMedium),
                  )
                )),
                Flexible(fit: FlexFit.tight, child: Padding(
                  padding: const EdgeInsets.all(1.0),
                  child: TextButton(
                    onPressed: () {
                      setState(() {
                        calculations = "0";
                        op = "";
                        previousCalculations = "";
                      });
                    },
                    style: GetIt.I<ButtonsStyleFactory>().buildButtonOperatorStyle(),
                    child: Text("C", style: Theme.of(context).textTheme.bodyMedium),
                  )
                )),
                Flexible(fit: FlexFit.tight, child: Padding(
                  padding: const EdgeInsets.all(1.0),
                  child: IconButton(
                    icon: const Icon(IconData(0xE94F, fontFamily: 'icons'), size: 18,),
                    onPressed: () {
                      setState(() {
                        if (calculations.length > 1) {
                          calculations = calculations.substring(0, calculations.length-1);
                          return;
                        }
                          calculations = "0";
                      });
                    },
                    style: GetIt.I<ButtonsStyleFactory>().buildButtonOperatorStyle(),
                  ),
                )),
              ],
            ),
          ),
          Flexible(
            fit: FlexFit.tight,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Flexible(fit: FlexFit.tight, child: Padding(
                  padding: const EdgeInsets.all(1.0),
                  child: IconButton(
                    icon: const Icon(IconData(0xF7C9, fontFamily: 'icons'), size: 18),
                    onPressed: () {
                      setState(() {
                        if ((1 / double.parse(calculations)) % 1 == 0) {
                          calculations = (1 ~/ double.parse(calculations)).toString();
                        } else {
                          calculations = (1 / double.parse(calculations)).toString();
                        }
                      });
                    },
                    style: GetIt.I<ButtonsStyleFactory>().buildButtonOperatorStyle(),
                  ),
                )),
                Flexible(fit: FlexFit.tight, child: Padding(
                  padding: const EdgeInsets.all(1.0),
                  child: IconButton(
                    icon: const Icon(IconData(0xF7C8, fontFamily: 'icons'), size: 18),
                    onPressed: () {
                      setState(() {
                        if ((double.parse(calculations) * double.parse(calculations)) % 1 == 0) {
                          calculations = (double.parse(calculations) * double.parse(calculations)).toInt().toString();
                        } else {
                          calculations = (double.parse(calculations) * double.parse(calculations)).toString();
                        }
                      });
                    },
                    style: GetIt.I<ButtonsStyleFactory>().buildButtonOperatorStyle(),
                  ),
                )),
                Flexible(fit: FlexFit.tight, child: Padding(
                  padding: const EdgeInsets.all(1.0),
                  child: IconButton(
                    icon: const Icon(IconData(0xF899, fontFamily: 'icons'), size: 18),
                    onPressed: () {
                      setState(() {
                        if ((sqrt(double.parse(calculations))) % 1 == 0) {
                          calculations = (sqrt(double.parse(calculations))).toInt().toString();
                        } else {
                          calculations = (sqrt(double.parse(calculations))).toString();
                        }
                      });
                    },
                    style: GetIt.I<ButtonsStyleFactory>().buildButtonOperatorStyle(),
                  ),
                )),
                Flexible(fit: FlexFit.tight, child: Padding(
                  padding: const EdgeInsets.all(1.0),
                  child: IconButton(
                    // icon: const Icon(Icons.percent),
                    icon: const Icon(IconData(0xE94A, fontFamily: 'icons'), size: 18),
                    onPressed: () {
                      setState(() {
                        previousCalculations = calculations;
                        op = "/";
                        calculations = "0";
                      });
                    },
                    style: GetIt.I<ButtonsStyleFactory>().buildButtonOperatorStyle(),
                  ),
                )),
              ],
            ),
          ),
          Flexible(
            fit: FlexFit.tight,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Flexible(fit: FlexFit.tight, child: Padding(
                  padding: const EdgeInsets.all(1.0),
                  child: TextButton(
                    onPressed: () {
                      setState(() {
                        if (calculations == "0")
                        {
                          calculations = "7";
                          return;
                        }
                        calculations += "7";
                      });
                    },
                    style: GetIt.I<ButtonsStyleFactory>().buildButtonNumberStyle(),
                    child: Text("7", style: Theme.of(context).textTheme.bodyMedium),
                  )
                )),
                Flexible(fit: FlexFit.tight, child: Padding(
                  padding: const EdgeInsets.all(1.0),
                  child: TextButton(
                    onPressed: () {
                      setState(() {
                        if (calculations == "0")
                        {
                          calculations = "8";
                          return;
                        }
                        calculations += "8";
                      });
                    },
                    style: GetIt.I<ButtonsStyleFactory>().buildButtonNumberStyle(),
                    child: Text("8", style: Theme.of(context).textTheme.bodyMedium),
                  )
                )),
                Flexible(fit: FlexFit.tight, child: Padding(
                  padding: const EdgeInsets.all(1.0),
                  child: TextButton(
                    onPressed: () {
                      setState(() {
                        if (calculations == "0")
                        {
                          calculations = "9";
                          return;
                        }
                        calculations += "9";
                      });
                    },
                    style: GetIt.I<ButtonsStyleFactory>().buildButtonNumberStyle(),
                    child: Text("9", style: Theme.of(context).textTheme.bodyMedium),
                  )
                )),
                Flexible(fit: FlexFit.tight, child: Padding(
                  padding: const EdgeInsets.all(1.0),
                  child: IconButton(
                    icon: const Icon(IconData(0xE947, fontFamily: 'icons'), size: 18),
                    onPressed: () {
                      setState(() {
                        previousCalculations = calculations;
                        op = "*";
                        calculations = "0";
                      });
                    },
                    style: GetIt.I<ButtonsStyleFactory>().buildButtonOperatorStyle(),
                  ),
                )),
              ],
            ),
          ),
          Flexible(
            fit: FlexFit.tight,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Flexible(fit: FlexFit.tight, child: Padding(
                  padding: const EdgeInsets.all(1.0),
                  child: TextButton(
                    onPressed: () {
                      setState(() {
                        if (calculations == "0")
                        {
                          calculations = "4";
                          return;
                        }
                        calculations += "4";
                      });
                    },
                    style: GetIt.I<ButtonsStyleFactory>().buildButtonNumberStyle(),
                    child: Text("4", style: Theme.of(context).textTheme.bodyMedium),
                  )
                )),
                Flexible(fit: FlexFit.tight, child: Padding(
                  padding: const EdgeInsets.all(1.0),
                  child: TextButton(
                    onPressed: () {
                      setState(() {
                        if (calculations == "0")
                        {
                          calculations = "5";
                          return;
                        }
                        calculations += "5";
                      });
                    },
                    style: GetIt.I<ButtonsStyleFactory>().buildButtonNumberStyle(),
                    child: Text("5", style: Theme.of(context).textTheme.bodyMedium),
                  )
                )),
                Flexible(fit: FlexFit.tight, child: Padding(
                  padding: const EdgeInsets.all(1.0),
                  child: TextButton(
                    onPressed: () {
                      setState(() {
                        if (calculations == "0")
                        {
                          calculations = "6";
                          return;
                        }
                        calculations += "6";
                      });
                    },
                    style: GetIt.I<ButtonsStyleFactory>().buildButtonNumberStyle(),
                    child: Text("6", style: Theme.of(context).textTheme.bodyMedium),
                  )
                )),
                Flexible(fit: FlexFit.tight, child: Padding(
                  padding: const EdgeInsets.all(1.0),
                  child: IconButton(
                    icon: const Icon(IconData(0xE949, fontFamily: 'icons'), size: 18),
                    onPressed: () {
                      setState(() {
                        previousCalculations = calculations;
                        op = "-";
                        calculations = "0";
                      });
                    },
                    style: GetIt.I<ButtonsStyleFactory>().buildButtonOperatorStyle(),
                  ),
                )),
              ],
            ),
          ),
          Flexible(
            fit: FlexFit.tight,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Flexible(fit: FlexFit.tight, child: Padding(
                  padding: const EdgeInsets.all(1.0),
                  child: TextButton(
                    onPressed: () {
                      setState(() {
                        if (calculations == "0")
                        {
                          calculations = "1";
                          return;
                        }
                        calculations += "1";
                      });
                    },
                    style: GetIt.I<ButtonsStyleFactory>().buildButtonNumberStyle(),
                    child: Text("1", style: Theme.of(context).textTheme.bodyMedium),
                  )
                )),
                Flexible(fit: FlexFit.tight, child: Padding(
                  padding: const EdgeInsets.all(1.0),
                  child: TextButton(
                    onPressed: () {
                      setState(() {
                        if (calculations == "0")
                        {
                          calculations = "2";
                          return;
                        }
                        calculations += "2";
                      });
                    },
                    style: GetIt.I<ButtonsStyleFactory>().buildButtonNumberStyle(),
                    child: Text("2", style: Theme.of(context).textTheme.bodyMedium),
                  )
                )),
                Flexible(fit: FlexFit.tight, child: Padding(
                  padding: const EdgeInsets.all(1.0),
                  child: TextButton(
                    onPressed: () {
                      setState(() {
                        if (calculations == "0")
                        {
                          calculations = "3";
                          return;
                        }
                        calculations += "3";
                      });
                    },
                    style: GetIt.I<ButtonsStyleFactory>().buildButtonNumberStyle(),
                    child: Text("3", style: Theme.of(context).textTheme.bodyMedium),
                  )
                )),
                Flexible(fit: FlexFit.tight, child: Padding(
                  padding: const EdgeInsets.all(1.0),
                  child: IconButton(
                    icon: const Icon(IconData(0xE948, fontFamily: 'icons'), size: 18),
                    onPressed: () {
                      setState(() {
                        previousCalculations = calculations;
                        op = "+";
                        calculations = "0";
                      });
                    },
                    style: GetIt.I<ButtonsStyleFactory>().buildButtonOperatorStyle(),
                  ),
                )),
              ],
            ),
          ),
          Flexible(
            fit: FlexFit.tight,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Flexible(fit: FlexFit.tight, child: Padding(
                  padding: const EdgeInsets.all(1.0),
                  child: IconButton(
                    icon: const Icon(IconData(0xF898, fontFamily: 'icons'), size: 18),
                    onPressed: () {
                      setState(() {
                        if (calculations[0] != '-') {
                          calculations = "-$calculations";
                        } else {
                          calculations = calculations.substring(1);
                        }
                      });
                    },
                    style: GetIt.I<ButtonsStyleFactory>().buildButtonNumberStyle(),
                  ),
                )),
                Flexible(fit: FlexFit.tight, child: Padding(
                  padding: const EdgeInsets.all(1.0),
                  child: TextButton(
                    onPressed: () {
                      setState(() {
                        if (calculations == "0")
                        {
                          calculations = "0";
                          return;
                        }
                        calculations += "0";
                      });
                    },
                    style: GetIt.I<ButtonsStyleFactory>().buildButtonNumberStyle(),
                    child: Text("0", style: Theme.of(context).textTheme.bodyMedium),
                  )
                )),
                Flexible(fit: FlexFit.tight, child: Padding(
                  padding: const EdgeInsets.all(1.0),
                  child: TextButton(
                    onPressed: () {
                      setState(() {
                        calculations += '.';
                      });
                    },
                    style: GetIt.I<ButtonsStyleFactory>().buildButtonNumberStyle(),
                    child: Text(",", style: Theme.of(context).textTheme.bodyMedium),
                  )
                )),
                Flexible(fit: FlexFit.tight, child: Padding(
                  padding: const EdgeInsets.all(1.0),
                  child: IconButton(
                    icon: const Icon(IconData(0xE94E, fontFamily: 'icons'), size: 18),
                    onPressed: () {
                      setState(() {
                        num? result;
                        switch(op) {
                          case "+": 
                            result = double.parse(calculations) + double.parse(previousCalculations); 
                            break;
                          case "-":
                            result = double.parse(previousCalculations) - double.parse(calculations); 
                            break;
                          case "*":
                            result = double.parse(calculations) * double.parse(previousCalculations); 
                            break;
                          case "/":
                            result = double.parse(previousCalculations) / double.parse(calculations); 
                            break;
                        }
                        if (result! % 1 == 0) {
                          calculations = result.toInt().toString();
                        } else {
                          calculations = result.toString();
                        }
                        op = "";
                        previousCalculations = "";
                      });
                    },
                    style: GetIt.I<ButtonsStyleFactory>().buildButtonEqualStyle(),
                  )
                )),
              ],
            ),
          ),
        ]
      ),
    );
  }
}
