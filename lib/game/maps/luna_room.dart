import 'package:bonfire/bonfire.dart';
import 'package:cubes/cubes.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:happy_luna/app/utils/dialog_choice.dart';
import 'package:happy_luna/game/decoration/luna_ball.dart';
import 'package:happy_luna/game/decoration/luna_room_door.dart';
import 'package:happy_luna/game/decoration/luna_toy.dart';
import 'package:happy_luna/game/decoration/room_place_position.dart';
import 'package:happy_luna/game/player/luna.dart';
import 'package:happy_luna/game/sounds/sounds_manager.dart';
import 'package:happy_luna/game/utils/dialogue.dart';
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
    SoundsManager.playMozart();
    Future.delayed(const Duration(seconds: 1), () {
      initialDialogue();
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  void afterChoice(int choice) {
    String reply = '';
    if (choice == 1) {
      reply = Cubes.getString('room_luna_4');
    } else if (choice == 2) {
      reply = Cubes.getString('room_luna_nope');
    }

    TalkDialog.show(
      context,
      [
        Dialogue.say('Luna', [
          TextSpan(
            text: reply,
          ),
        ]),
        Dialogue.say('Luna', [
          TextSpan(
            text: Cubes.getString('room_luna_5'),
          ),
        ]),
        Dialogue.say('Luna', [
          TextSpan(
            text: Cubes.getString('room_luna_6'),
          ),
        ]),
        Dialogue.say('Luna', [
          TextSpan(
            text: Cubes.getString('room_luna_7'),
          ),
        ]),
        Dialogue.say('Luna', [
          TextSpan(
            text: Cubes.getString('room_luna_8'),
          ),
        ]),
        Dialogue.say('Luna', [
          TextSpan(
            text: Cubes.getString('room_luna_9'),
          ),
        ]),
        Dialogue.say('Luna', [
          TextSpan(
            text: Cubes.getString('room_luna_10'),
          ),
        ]),
        Dialogue.say('Luna', [
          TextSpan(
            text: Cubes.getString('room_luna_11'),
          ),
        ]),
      ],
    );
  }

  void initialDialogue() {
    TalkDialog.show(context, [
      Dialogue.say('Luna', [
        TextSpan(
          text: Cubes.getString('room_luna_1'),
        ),
      ]),
      Dialogue.say('Luna', [
        TextSpan(
          text: Cubes.getString('room_luna_2'),
        ),
      ]),
      Dialogue.say('Luna', [
        TextSpan(
          text: Cubes.getString('room_luna_3'),
        ),
      ]),
    ], finish: () async {
      await Future.delayed(const Duration(milliseconds: 300));
      DialogChoice().show(
          context,
          Colors.orange,
          Cubes.getString('room_choice_1'),
          () async {
            await Future.delayed(const Duration(milliseconds: 200));
            context.pop();
            await Future.delayed(const Duration(milliseconds: 200));
            afterChoice(1);
          },
          Colors.purple,
          Cubes.getString('room_choice_2'),
          () async {
            await Future.delayed(const Duration(milliseconds: 200));
            context.pop();
            await Future.delayed(const Duration(milliseconds: 200));
            afterChoice(2);
          });
    });
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
          player: Luna(Vector2(componentsBaseSize * 4, componentsBaseSize * 2)),
          background: BackgroundColorGame(Colors.black),
          map: TiledWorldMap(
            'tiled/luna_room_map.json',
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
