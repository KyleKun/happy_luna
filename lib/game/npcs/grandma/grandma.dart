import 'package:bonfire/bonfire.dart';
import 'package:bonfire/decoration/decoration.dart';

import '../../../main.dart';

class Grandma extends GameDecoration {
  Grandma(Vector2 position)
      : super.withSprite(
          Sprite.load('npc/grandma.png'),
          position: position,
          width: componentsBaseSize * 1.3,
          height: componentsBaseSize * 2.4,
        );
}
