import 'package:bonfire/bonfire.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:happy_luna/game/decoration/handheld.dart';
import 'package:happy_luna/game/decoration/wash.dart';
import 'package:happy_luna/game/npcs/grandma/grandma.dart';
import 'package:happy_luna/game/player/luna.dart';
import 'package:happy_luna/game/sounds/sounds_manager.dart';
import 'package:happy_luna/main.dart';

class LunaKitchen extends StatefulWidget {
  const LunaKitchen({Key? key}) : super(key: key);

  @override
  _LunaKitchenState createState() => _LunaKitchenState();
}

class _LunaKitchenState extends State<LunaKitchen> {
  @override
  void initState() {
    SoundsManager.playSchumann();
    Future.delayed(const Duration(seconds: 3), () {
      grandmaDialogue();
    });
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return BonfireTiledWidget(
          progress: const SizedBox(),
          interface: GameInterface(),
          // showCollisionArea: true,
          // constructionMode: true,
          joystick: Joystick(
            directional: JoystickDirectional(
              isFixed: true,
              margin: EdgeInsets.only(
                left: MediaQuery.of(context).size.width * 0.9,
                bottom: 60,
              ),
            ),
          ),
          cameraConfig: CameraConfig(
            moveOnlyMapArea: true,
            sizeMovementWindow: const Size(50, 50),
            smoothCameraEnable: true,
            smoothCameraSpeed: 1.0,
            zoom: 1.5,
          ),
          player:
              Luna(Vector2(componentsBaseSize * 5.6, componentsBaseSize * 0.3)),
          background: BackgroundColorGame(Colors.black),
          map: TiledWorldMap(
            'tiled/kitchen_map.json',
            forceTileSize: Size(tileSize, tileSize),
            objectsBuilder: {
              'grandma': (properties) => Grandma(properties.position),
              'wash': (properties) => Wash(properties.position),
              'game': (properties) => Handheld(properties.position),
            },
          ),
        );
      },
    );
  }

  void grandmaDialogue() {}
}
