import 'package:flutter/material.dart';

final theme = ThemeData(
        scaffoldBackgroundColor: const Color.fromARGB(255, 20, 20, 20),
        appBarTheme: const AppBarTheme(
          backgroundColor: Color.fromARGB(255, 20, 20, 20),
        ),
        textTheme: const TextTheme(
          bodyLarge: TextStyle(
            color: Color.fromRGBO(255, 255, 255, 1),
            fontSize: 56,
            fontWeight: FontWeight.w500,
          ),
          bodyMedium: TextStyle(
            color: Color.fromRGBO(255, 255, 255, 1),
            fontSize: 20,
            fontWeight: FontWeight.w400,
          ),
          bodySmall: TextStyle(
            color: Colors.white,
            fontSize: 12,
            fontWeight: FontWeight.w300
          )
        )
      );

class ButtonsStyleFactory {
  ButtonStyle _buildSkeleton(Color backgroundColor, Color iconColor){
    return ButtonStyle(
      backgroundColor: MaterialStatePropertyAll<Color>(backgroundColor),
      iconColor: MaterialStatePropertyAll<Color>(iconColor),
      textStyle: MaterialStatePropertyAll<TextStyle>(TextStyle(color: iconColor)),
      shape: MaterialStatePropertyAll<RoundedRectangleBorder>(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5),
        )
      )
    );
  }

  ButtonStyle buildButtonNumberStyle() {
    return _buildSkeleton(const Color.fromARGB(255, 59, 59, 59), Colors.white);
  }

  ButtonStyle buildButtonOperatorStyle() {
    return _buildSkeleton(const Color.fromARGB(255, 32, 32, 32), Colors.white);
  }

  ButtonStyle buildButtonEqualStyle() {
    return _buildSkeleton(const Color.fromARGB(255, 138, 157, 182), Colors.black);
  }
}