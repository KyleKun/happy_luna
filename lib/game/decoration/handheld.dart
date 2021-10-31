import 'package:bonfire/bonfire.dart';
import 'package:bonfire/decoration/decoration.dart';
import 'package:flutter/material.dart';

import '../../main.dart';

class Handheld extends GameDecoration with TapGesture {
  Handheld(Vector2 position)
      : super.withSprite(
          Sprite.load('decoration/game.png'),
          position: position,
          width: componentsBaseSize,
          height: componentsBaseSize,
        );

  @override
  void onTap() {
    print('handheld tapped');
  }

  @override
  void onTapCancel() {}

  @override
  void onTapDown(int pointer, Offset position) {}

  @override
  void onTapUp(int pointer, Offset position) {}
}
