import 'package:flame_splash_screen/flame_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:cubes/cubes.dart';
import 'package:happy_luna/game/maps/luna_room.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FlameSplashScreen(
      theme: FlameSplashTheme.dark,
      controller: FlameSplashController(
        waitDuration: const Duration(seconds: 1),
        fadeOutDuration: const Duration(seconds: 4),
      ),
      onFinish: (context) => context.goToReplacement(const LunaRoom()),
    );
  }
}
