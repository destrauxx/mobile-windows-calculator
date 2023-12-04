import 'package:calculator/calculator_widget.dart';
import 'package:calculator/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

void main() {
  GetIt.I.registerLazySingleton<ButtonsStyleFactory>(() => ButtonsStyleFactory());
  runApp(const CalculatorApp());
}

