import 'package:bonfire/bonfire.dart';
import 'package:bonfire/decoration/decoration.dart';
import 'package:happy_luna/game/decoration/luna_ball.dart';
import 'package:happy_luna/game/decoration/luna_toy.dart';
import 'package:happy_luna/game/player/luna.dart';

import '../../main.dart';

class RoomPlacePosition extends GameDecoration with Sensor {
  RoomPlacePosition(Vector2 position)
      : super.withSprite(
          Sprite.load('tiled/wall.png'),
          position: position,
          width: componentsBaseSize / 2,
          height: componentsBaseSize / 2,
        );

  @override
  void onContact(GameComponent component) {
    if (component is LunaBall && !(gameRef.player as Luna).doneBall) {
      (gameRef.player as Luna).doneBall = true;
    } else if (component is LunaToy && !(gameRef.player as Luna).doneToy) {
      (gameRef.player as Luna).doneToy = true;
    }
  }
}
