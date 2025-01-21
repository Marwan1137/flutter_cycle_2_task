import 'package:flutter/material.dart';

class AppTheme {
  /* -------------------------------------------------------------------------- */
  /*                                   Colors                                   */
  /* -------------------------------------------------------------------------- */
  static const Color primaryColor = Color.fromARGB(255, 38, 8, 211);
  static const Color white = Colors.white;
  static const Color black = Colors.black;

  /* -------------------------------------------------------------------------- */
  /*                                 text styles                                */
  /* -------------------------------------------------------------------------- */
  static const TextStyle titleTextStyle = TextStyle(
    fontSize: 14,
    color: Colors.black,
    fontWeight: FontWeight.bold,
  );

  static const TextStyle descriptionTextStyle = TextStyle(
    fontSize: 14,
    color: Colors.black,
  );

  static const TextStyle priceTextStyle = TextStyle(
    fontSize: 14,
    color: Colors.black,
    fontWeight: FontWeight.bold,
  );

  static const TextStyle reviewTextStyle = TextStyle(
    fontSize: 14,
    color: Colors.black,
  );

  /* -------------------------------------------------------------------------- */
  /*                      BoxDecoration for reusable styles                     */
  /* -------------------------------------------------------------------------- */
  static BoxDecoration containerDecoration = BoxDecoration(
    borderRadius: BorderRadius.circular(15),
    color: primaryColor,
  );
}
