import 'package:bonfire/bonfire.dart';
import 'package:bonfire/decoration/decoration.dart';
import 'package:happy_luna/game/decoration/luna_ball.dart';
import 'package:happy_luna/game/decoration/luna_toy.dart';

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
    if (component is LunaBall) {
      print('Ball done');
    } else if (component is LunaToy) {
      print('Toy done');
    }
  }
}
