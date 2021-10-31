import 'package:bonfire/bonfire.dart';
import 'package:bonfire/decoration/decoration.dart';
import 'package:flutter/material.dart';

import '../../main.dart';

class Wash extends GameDecoration with TapGesture {
  Wash(Vector2 position)
      : super.withSprite(
          Sprite.load('tiled/wall.png'),
          position: position,
          width: tileSize,
          height: tileSize,
        );

  @override
  void onTap() {
    print('open door');
  }

  @override
  void onTapCancel() {}

  @override
  void onTapDown(int pointer, Offset position) {}

  @override
  void onTapUp(int pointer, Offset position) {}
}
