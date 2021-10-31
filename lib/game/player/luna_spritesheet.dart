import 'package:bonfire/bonfire.dart';

class LunaSpriteSheet {
  static const double stepTime = 0.3;
  static Vector2 textureSize = Vector2(720, 1280);

  static Future<SpriteAnimation> get idleLeft => SpriteAnimation.load(
        'player/luna_idle_spritesheet.png',
        SpriteAnimationData.sequenced(
          amount: 2,
          stepTime: stepTime,
          textureSize: textureSize,
        ),
      );

  static Future<SpriteAnimation> get idleRight => SpriteAnimation.load(
        'player/luna_idle_spritesheet.png',
        SpriteAnimationData.sequenced(
          amount: 2,
          stepTime: stepTime,
          textureSize: textureSize,
        ),
      );

  static Future<SpriteAnimation> get runRight => SpriteAnimation.load(
        'player/luna_walk_spritesheet.png',
        SpriteAnimationData.sequenced(
          amount: 4,
          stepTime: stepTime,
          textureSize: textureSize,
        ),
      );

  static Future<SpriteAnimation> get runLeft => SpriteAnimation.load(
        'player/luna_walk_spritesheet.png',
        SpriteAnimationData.sequenced(
          amount: 4,
          stepTime: stepTime,
          textureSize: textureSize,
        ),
      );

  static SimpleDirectionAnimation get simpleDirectionAnimation =>
      SimpleDirectionAnimation(
        // LEFT
        idleLeft: idleLeft,
        idleDownLeft: idleLeft,
        idleUpLeft: idleLeft,
        runLeft: runLeft,
        runUpLeft: runLeft,
        runDownLeft: runLeft,

        // RIGHT
        idleRight: idleRight,
        idleDownRight: idleRight,
        idleUpRight: idleRight,
        runRight: runRight,
        runUpRight: runRight,
        runDownRight: runRight,
      );
}
