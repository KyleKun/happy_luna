import 'package:bonfire/bonfire.dart';
import 'package:flutter/material.dart';

class Dialogue {
  static Say say(List<TextSpan> text) {
    return Say(
      text: text,
      boxDecoration: BoxDecoration(
        color: Colors.black87,
        border: Border.all(width: 5.0, color: Colors.red.shade900),
        borderRadius: BorderRadius.circular(25.0),
      ),
      // textStyle: TextStyle(fontSize: 20.0),
      // margin: const EdgeInsets.symmetric(horizontal: 100.0),
    );
  }
}
