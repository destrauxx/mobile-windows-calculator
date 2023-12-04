import 'package:flutter/material.dart';

Row buildCalculatorCalculations(context) {
  return Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 50, bottom: 105),
                child: Text(
                  maxLines: 1,
                  "0",
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
              )
            ]
          );
}