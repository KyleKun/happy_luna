import 'package:bonfire/bonfire.dart';
import 'package:flutter/material.dart';

import '../../main.dart';
import 'luna_spritesheet.dart';

class Luna extends SimplePlayer with ObjectCollision {
  static double maxSpeed = 400;

  bool lockMove = false;

  Luna(Vector2 position)
      : super(
          position: position,
          animation: LunaSpriteSheet.simpleDirectionAnimation,
          speed: maxSpeed,
          width: componentsBaseSize * 1.3,
          height: componentsBaseSize * 2,
        ) {
    setupCollision(
      CollisionConfig(
        collisions: [
          CollisionArea.rectangle(
            size: Size(componentsBaseSize / 2, componentsBaseSize * 0.6),
            align: Vector2(componentsBaseSize / 2.2, componentsBaseSize * 1.1),
          ),
        ],
      ),
    );
  }

  @override
  void joystickAction(JoystickActionEvent event) {
    if (isDead) return;

    if (event.id == 1 && event.event == ActionEvent.DOWN) {
      print('Action 1');
    }
  }

  @override
  void joystickChangeDirectional(JoystickDirectionalEvent event) {
    if (lockMove) {
      return;
    }
    speed = maxSpeed * event.intensity;
    super.joystickChangeDirectional(event);
  }
}
