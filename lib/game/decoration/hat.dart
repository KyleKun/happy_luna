import 'package:bonfire/bonfire.dart';
import 'package:bonfire/decoration/decoration.dart';

import '../../main.dart';

class Handheld extends GameDecoration {
  Handheld(Vector2 position)
      : super.withSprite(
          Sprite.load('decoration/hat.png'),
          position: position,
          width: tileSize,
          height: tileSize,
        );
}
