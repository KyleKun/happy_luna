import 'package:bonfire/bonfire.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:happy_luna/game/decoration/handheld.dart';
import 'package:happy_luna/game/decoration/wash.dart';
import 'package:happy_luna/game/player/luna.dart';
import 'package:happy_luna/main.dart';

class LunaKitchen extends StatefulWidget {
  const LunaKitchen({Key? key}) : super(key: key);

  @override
  _LunaKitchenState createState() => _LunaKitchenState();
}

class _LunaKitchenState extends State<LunaKitchen> {
  @override
  void initState() {
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
          showCollisionArea: true,
          // constructionMode: true,
          joystick: Joystick(
            directional: JoystickDirectional(isFixed: true),
          ),
          cameraConfig: CameraConfig(
            moveOnlyMapArea: true,
            sizeMovementWindow: const Size(50, 50),
            smoothCameraEnable: true,
            smoothCameraSpeed: 1.0,
            zoom: 1.0,
          ),
          player: Luna(Vector2(componentsBaseSize * 4, componentsBaseSize)),
          background: BackgroundColorGame(Colors.black),
          map: TiledWorldMap(
            'tiled/kitchen_map.json',
            forceTileSize: Size(tileSize, tileSize),
            objectsBuilder: {
              'wash': (properties) => Wash(properties.position),
              'game': (properties) => Handheld(properties.position),
            },
          ),
        );
      },
    );
  }
}
