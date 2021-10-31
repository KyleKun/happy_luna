import 'package:bonfire/bonfire.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:happy_luna/game/decoration/luna_ball.dart';
import 'package:happy_luna/game/decoration/luna_room_door.dart';
import 'package:happy_luna/game/decoration/luna_toy.dart';
import 'package:happy_luna/game/decoration/room_place_position.dart';
import 'package:happy_luna/game/player/luna.dart';
import 'package:happy_luna/main.dart';

class LunaRoom extends StatefulWidget {
  const LunaRoom({Key? key}) : super(key: key);

  @override
  _LunaRoomState createState() => _LunaRoomState();
}

class _LunaRoomState extends State<LunaRoom> {
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
          // showCollisionArea: true,
          // constructionMode: true,
          joystick: Joystick(
            directional: JoystickDirectional(isFixed: true),
          ),
          cameraConfig: CameraConfig(
            moveOnlyMapArea: true,
            sizeMovementWindow: const Size(50, 50),
            smoothCameraEnable: true,
            smoothCameraSpeed: 1.0,
            zoom: 0.2,
          ),
          player: Luna(Vector2(componentsBaseSize * 4, componentsBaseSize * 3)),
          background: BackgroundColorGame(Colors.black),
          map: TiledWorldMap(
            'tiled/luna_room.json',
            forceTileSize: Size(tileSize, tileSize),
            objectsBuilder: {
              'ball': (properties) => LunaBall(properties.position),
              'toy': (properties) => LunaToy(properties.position),
              'door': (properties) => LunaRoomDoor(properties.position),
              'position': (properties) =>
                  RoomPlacePosition(properties.position),
            },
          ),
        );
      },
    );
  }
}