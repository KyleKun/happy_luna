import 'dart:io';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:cubes/cubes.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:happy_luna/game/sounds/sounds_manager.dart';

class CreditsScreen extends StatefulWidget {
  const CreditsScreen({
    Key? key,
  }) : super(key: key);

  @override
  _CreditsScreenState createState() => _CreditsScreenState();
}

class _CreditsScreenState extends State<CreditsScreen> {
  final name = 'Caio Pedroso';

  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(milliseconds: 500), () {
      SoundsManager.playChopinEnd();
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
              Future.delayed(const Duration(seconds: 1)).then((_) {
                exit(0);
              });
            },
            animatedTexts: [
              FadeAnimatedText(
                Cubes.getString('credits'),
                duration: const Duration(seconds: 3),
              ),
              FadeAnimatedText(
                Cubes.getString('credits_1', params: {'{name}': name}),
                textAlign: TextAlign.center,
                duration: const Duration(seconds: 6),
                textStyle: TextStyle(
                  color: Colors.white,
                  fontFamily: 'Butterfly',
                  fontSize: MediaQuery.of(context).size.height / 7,
                ),
              ),
              FadeAnimatedText(
                Cubes.getString('credits_2', params: {'{name}': name}),
                duration: const Duration(seconds: 6),
                textAlign: TextAlign.center,
                textStyle: TextStyle(
                  color: Colors.white,
                  fontFamily: 'Butterfly',
                  fontSize: MediaQuery.of(context).size.height / 7,
                ),
              ),
              FadeAnimatedText(
                Cubes.getString('credits_3', params: {'{name}': name}),
                textAlign: TextAlign.center,
                duration: const Duration(seconds: 6),
                textStyle: TextStyle(
                  color: Colors.white,
                  fontFamily: 'Butterfly',
                  fontSize: MediaQuery.of(context).size.height / 7,
                ),
              ),
              FadeAnimatedText(
                Cubes.getString('credits_4', params: {'{name}': name}),
                duration: const Duration(seconds: 6),
                textAlign: TextAlign.center,
                textStyle: TextStyle(
                  color: Colors.white,
                  fontFamily: 'Butterfly',
                  fontSize: MediaQuery.of(context).size.height / 7,
                ),
              ),
              FadeAnimatedText(
                Cubes.getString('thanks_for_playing'),
                textAlign: TextAlign.center,
                duration: const Duration(seconds: 6),
                textStyle: TextStyle(
                  color: Colors.white,
                  fontFamily: 'Butterfly',
                  fontSize: MediaQuery.of(context).size.height / 6,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
