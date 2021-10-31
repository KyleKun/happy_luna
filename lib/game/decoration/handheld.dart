import 'package:bonfire/bonfire.dart';
import 'package:bonfire/decoration/decoration.dart';
import 'package:cubes/cubes.dart';
import 'package:flutter/material.dart';
import 'package:happy_luna/game/maps/luna_kitchen.dart';
import 'package:happy_luna/game/minigames/maze_minigame.dart';
import 'package:happy_luna/game/player/luna.dart';
import 'package:happy_luna/game/sounds/sounds_manager.dart';
import 'package:happy_luna/game/utils/dialogue.dart';
import 'package:happy_luna/game/utils/text_paints.dart';

class Handheld extends GameDecoration with ObjectCollision, TapGesture {
  late TextPaint _textPaint;
  Handheld(Vector2 position)
      : super.withSprite(
          Sprite.load('decoration/game.png'),
          position: position,
          width: 60,
          height: 40,
        ) {
    setupCollision(
      CollisionConfig(
        collisions: [
          CollisionArea.rectangle(
            size: const Size(25, 25),
            align: Vector2(20, 10),
          ),
        ],
      ),
    );
    _textPaint = TextPaints.hideText;
  }
  @override
  int get priority => LayerPriority.MAP + 1;

  @override
  void render(Canvas canvas) {
    super.render(canvas);
    _textPaint.render(
      canvas,
      Cubes.getString('play'),
      Vector2(
        position.left + width / 4,
        position.top - width / 5.5,
      ),
    );
  }

  @override
  void update(dt) {
    super.update(dt);

    seeComponent(
      gameRef.player as Luna,
      observed: (player) => _textPaint = TextPaints.showSmallWhiteText,
      notObserved: () => _textPaint = TextPaints.hideText,
      radiusVision: 40.0,
    );
  }

  @override
  void onTap() async {
    if (_textPaint.config.color != Colors.transparent) {
      SoundsManager.playBach();

      TalkDialog.show(context, [
        Dialogue.say('Luna', [
          TextSpan(
            text: Cubes.getString('game_1'),
          ),
        ]),
        Dialogue.say('Luna', [
          TextSpan(
            text: Cubes.getString('game_2'),
          ),
        ]),
        Dialogue.say('Luna', [
          TextSpan(
            text: Cubes.getString('game_3'),
          ),
        ]),
        Dialogue.say('Luna', [
          TextSpan(
            text: Cubes.getString('game_4'),
          ),
        ]),
        Dialogue.say('Luna', [
          TextSpan(
            text: Cubes.getString('game_5'),
          ),
        ]),
        Dialogue.say('Luna', [
          TextSpan(
            text: Cubes.getString('game_6'),
          ),
        ]),
      ], finish: () async {
        await Future.delayed(const Duration(milliseconds: 300));
        showGeneralDialog(
            barrierDismissible: false,
            barrierColor: Colors.transparent,
            context: context,
            transitionDuration: const Duration(milliseconds: 500),
            transitionBuilder: (context, anim1, anim2, child) {
              return SlideTransition(
                position:
                    Tween(begin: const Offset(0, 1), end: const Offset(0, 0))
                        .animate(anim1),
                child: child,
              );
            },
            pageBuilder: (context, anim1, anim2) {
              return Align(
                alignment: Alignment.center,
                child: Dialog(
                  backgroundColor: Colors.transparent,
                  child: MazeMinigame(gameRef: gameRef),
                ),
              );
            });
      });
    }
  }

  @override
  void onTapCancel() {}

  @override
  void onTapDown(int pointer, Offset position) {}

  @override
  void onTapUp(int pointer, Offset position) {}
}
