import 'package:bonfire/bonfire.dart';
import 'package:bonfire/decoration/decoration.dart';

import '../../main.dart';

class LunaBall extends GameDecoration with DragGesture {
  LunaBall(Vector2 position)
      : super.withSprite(
          Sprite.load('decoration/luna_ball.png'),
          position: position,
          width: componentsBaseSize,
          height: componentsBaseSize,
        );
}
