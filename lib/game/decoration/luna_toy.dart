import 'package:bonfire/bonfire.dart';
import 'package:bonfire/decoration/decoration.dart';

import '../../main.dart';

class LunaToy extends GameDecoration with DragGesture {
  LunaToy(Vector2 position)
      : super.withSprite(
          Sprite.load('decoration/luna_toy.png'),
          position: position,
          width: componentsBaseSize * 0.6,
          height: componentsBaseSize,
        );
}
