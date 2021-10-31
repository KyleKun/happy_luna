import 'package:flutter/material.dart';
import 'package:cubes/cubes.dart';
import 'package:maze/maze.dart';

class MazeMinigame extends StatefulWidget {
  const MazeMinigame({Key? key}) : super(key: key);

  @override
  _MazeMinigameState createState() => _MazeMinigameState();
}

class _MazeMinigameState extends State<MazeMinigame> {
  bool completed = false;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.pink.withOpacity(0.8),
      child: SizedBox(
        child: Maze(
            player: MazeItem(
              'assets/images/player/luna_idle.png',
              ImageType.asset,
            ),
            columns: 18,
            rows: 9,
            wallThickness: 4.0,
            wallColor: Colors.white,
            finish: MazeItem(
              'assets/images/vitas.png',
              ImageType.asset,
            ),
            onFinish: () async {
              if (!completed) {
                await Future.delayed(const Duration(milliseconds: 800));
                context.pop();
                // TODO: continue
              }

              setState(() {
                completed = true;
              });
            }),
      ),
    );
  }
}
