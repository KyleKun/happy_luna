import 'package:bonfire/bonfire.dart';
import 'package:bonfire/decoration/decoration.dart';
import 'package:flutter/material.dart';

import '../../main.dart';

class Hat extends GameDecoration {
  Hat(Vector2 position)
      : super.withSprite(
          Sprite.load('decoration/hat.png'),
          position: position,
          width: componentsBaseSize,
          height: componentsBaseSize * 1.3,
        );

  @override
  int get priority => LayerPriority.MAP + 4;
}
