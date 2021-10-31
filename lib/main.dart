import 'dart:math';

import 'package:bonfire/bonfire.dart';
import 'package:cubes/cubes.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'app/screens/splash/splash_screen.dart';
import 'app/utils/fade_in_transition_builder.dart';
import 'game/sounds/sounds_manager.dart';

double tileSize = 80.0;
double componentsBaseSize = tileSize * 2;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SoundsManager.initialize();
  if (!kIsWeb) {
    await Flame.device.setLandscape();
    await Flame.device.fullScreen();
  }
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  final cubeLocation = CubesLocalizationDelegate(
    const [
      Locale('en', 'US'),
      // Locale('pt', 'BR'),
    ],
  );

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Happy Luna',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Butterfly',
        primarySwatch: Colors.pink,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        pageTransitionsTheme: const PageTransitionsTheme(
          builders: {
            TargetPlatform.android: FadeInPageTransitionsBuilder(),
            TargetPlatform.windows: FadeInPageTransitionsBuilder(),
          },
        ),
      ),
      localizationsDelegates: cubeLocation.delegates,
      supportedLocales: cubeLocation.supportedLocations,
      home: LayoutBuilder(
        builder: (context, constraints) {
          tileSize = (max(constraints.maxHeight, constraints.maxWidth) / 30)
              .ceilToDouble();
          return const SplashScreen();
        },
      ),
    );
  }
}
