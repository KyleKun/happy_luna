import 'package:bonfire/bonfire.dart';
import 'package:bonfire/decoration/decoration.dart';
import 'package:cubes/cubes.dart';
import 'package:flutter/material.dart';
import 'package:happy_luna/game/maps/luna_kitchen.dart';
import 'package:happy_luna/game/player/luna.dart';
import 'package:happy_luna/game/sounds/sounds_manager.dart';
import 'package:happy_luna/game/utils/text_paints.dart';

class LunaRoomDoor extends GameDecoration with ObjectCollision, TapGesture {
  late TextPaint _textPaint;
  LunaRoomDoor(Vector2 position)
      : super.withSprite(
          Sprite.load('tiled/wall.png'),
          position: position,
          width: 60,
          height: 40,
        ) {
    setupCollision(
      CollisionConfig(
        collisions: [
          CollisionArea.rectangle(
            size: const Size(50, 50),
            align: Vector2(-5, 5),
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
      Cubes.getString('open'),
      Vector2(
        position.left + width / 6,
        position.top - width / 7,
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
      radiusVision: 80.0,
    );
  }

  @override
  void onTap() async {
    if (_textPaint.config.color != Colors.transparent) {
      if ((gameRef.player as Luna).unlockDoor) {
        SoundsManager.doorOpen();
        await Future.delayed(const Duration(milliseconds: 1200));
        context.goToReplacement(const LunaKitchen());
      } else {
        SoundsManager.doorKnock();
      }
    }
  }

  @override
  void onTapCancel() {}

  @override
  void onTapDown(int pointer, Offset position) {}

  @override
  void onTapUp(int pointer, Offset position) {}
}
