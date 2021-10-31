import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:cubes/cubes.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:happy_luna/game/maps/luna_room.dart';
import 'package:happy_luna/game/sounds/sounds_manager.dart';

class IntroScreen extends StatefulWidget {
  const IntroScreen({
    Key? key,
  }) : super(key: key);

  @override
  _IntroScreenState createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(seconds: 3), () {
      SoundsManager.playBeethoven();
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        color: Colors.black,
        child: Center(
          child: AnimatedTextKit(
            isRepeatingAnimation: false,
            onFinished: () {
              SoundsManager.fadeOutBgm();

              Future.delayed(const Duration(seconds: 1)).then((_) {
                context.goToReplacement(const LunaRoom());
              });
            },
            animatedTexts: [
              FadeAnimatedText(
                '',
                duration: const Duration(seconds: 1),
              ),
              FadeAnimatedText(
                Cubes.getString('intro_1'),
                textAlign: TextAlign.center,
                duration: const Duration(seconds: 8),
                textStyle: TextStyle(
                  color: Colors.white,
                  fontFamily: 'Butterfly',
                  fontSize: MediaQuery.of(context).size.height / 8,
                ),
              ),
              FadeAnimatedText(
                Cubes.getString('intro_2'),
                duration: const Duration(seconds: 10),
                textAlign: TextAlign.center,
                textStyle: TextStyle(
                  color: Colors.white,
                  fontFamily: 'Butterfly',
                  fontSize: MediaQuery.of(context).size.height / 10,
                ),
              ),
              FadeAnimatedText(
                Cubes.getString('intro_3'),
                textAlign: TextAlign.center,
                duration: const Duration(seconds: 8),
                textStyle: TextStyle(
                  color: Colors.white,
                  fontFamily: 'Butterfly',
                  fontSize: MediaQuery.of(context).size.height / 10,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
