import 'package:bonfire/bonfire.dart';
import 'package:flutter/material.dart';

class Dialogue {
  static TextStyle get defaultTextStyle => const TextStyle(
        fontSize: 22,
        color: Colors.white,
      );

  static TextStyle get personTextStyle => const TextStyle(
        fontSize: 42,
        color: Colors.white,
        fontFamily: 'Princess',
        // backgroundColor: Colors.black,
      );

  static TextStyle get choiceTextStyle => const TextStyle(
        fontSize: 28,
        color: Colors.white,
        fontFamily: 'Princess',
        // backgroundColor: Colors.black,
      );

  static Say say(String person, List<TextSpan> text) {
    return Say(
      person: Text(
        person,
        style: personTextStyle,
      ),
      text: text,
      boxDecoration: BoxDecoration(
        color: Colors.pink.withOpacity(0.7),
        border: Border.all(
          width: 5.0,
          color: Colors.black.withOpacity(0.85),
        ),
        borderRadius: BorderRadius.circular(25.0),
      ),
      margin: const EdgeInsets.only(
        right: 110.0,
        left: 10,
      ),
    );
  }
}
