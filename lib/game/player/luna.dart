import 'package:bonfire/bonfire.dart';
import 'package:cubes/cubes.dart';
import 'package:flutter/material.dart';
import 'package:happy_luna/game/utils/dialogue.dart';

import '../../main.dart';
import 'luna_spritesheet.dart';

class Luna extends SimplePlayer with ObjectCollision {
  static double maxSpeed = 90;

  bool lockMove = false;

  bool doneBall = false;
  bool doneToy = false;
  bool roomClear = false;
  bool unlockDoor = false;

  Luna(Vector2 position)
      : super(
          position: position,
          animation: LunaSpriteSheet.simpleDirectionAnimation,
          speed: maxSpeed,
          // width: componentsBaseSize * 1.3,
          // height: componentsBaseSize * 2,
          width: componentsBaseSize,
          height: componentsBaseSize * 2,
        ) {
    setupCollision(
      CollisionConfig(
        collisions: [
          CollisionArea.rectangle(
            size: Size(componentsBaseSize / 2, componentsBaseSize / 1.2),
            align: Vector2(componentsBaseSize / 3, componentsBaseSize),
            // size: Size(componentsBaseSize / 2, componentsBaseSize * 0.6),
            // align: Vector2(componentsBaseSize / 2.2, componentsBaseSize * 1.1),
          ),
        ],
      ),
    );
  }

  @override
  void update(double dt) {
    if (!roomClear) {
      if (doneBall && doneToy) {
        roomClear = true;
        Future.delayed(
            const Duration(milliseconds: 500),
            () => TalkDialog.show(gameRef.context, [
                  Dialogue.say(
                    'Luna',
                    [
                      TextSpan(
                        text: Cubes.getString('room_luna_done'),
                      ),
                    ],
                  ),
                ], finish: () {
                  unlockDoor = true;
                }));
      }
    }
    super.update(dt);
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
