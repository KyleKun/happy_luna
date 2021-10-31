import 'dart:async';
import 'package:flame_audio/flame_audio.dart';

class SoundsManager {
  static Future initialize() async {
    FlameAudio.bgm.initialize();

    await FlameAudio.audioCache.loadAll([
      'sfx/button_click.ogg',
      'sfx/door_knock.ogg',
      'sfx/door_open.ogg',
    ]);
  }

  static void buttonClick() {
    FlameAudio.audioCache.play('sfx/button_click.ogg', volume: 0.6);
  }

  static void doorKnock() {
    FlameAudio.audioCache.play('sfx/door_knock.ogg', volume: 0.6);
  }

  static void doorOpen() {
    FlameAudio.audioCache.play('sfx/door_open.ogg', volume: 0.6);
  }

  static void stopBgm() async {
    await FlameAudio.bgm.stop();
  }

  static void playMozart() async {
    FlameAudio.bgm.play('bgm/mozart.mp3');
    fadeInBgm();
  }

  static void playBeethoven() async {
    FlameAudio.bgm.play('bgm/beethoven.mp3');
    fadeInBgm();
  }

  static void playChopinEnd() async {
    FlameAudio.bgm.play('bgm/chopin_end.mp3');
    fadeInBgm();
  }

  static void playSchumann() async {
    FlameAudio.bgm.play('bgm/schumann.mp3');
    fadeInBgm();
  }

  static void playBach() async {
    stopBgm();
    FlameAudio.bgm.play('bgm/bach.mp3');
    fadeInBgm();
  }

  static void playChopinRevelation() async {
    FlameAudio.bgm.play('bgm/chopin_revelation.mp3');
    fadeInBgm();
  }

  // static void playIntroBgm() async {
  //   await stopBgm();
  //   FlameAudio.bgm.play('music/intro.mp3');
  //   fadeInBgm();
  // }

  static void pauseBgm() {
    FlameAudio.bgm.pause();
  }

  static void resumeBgm() {
    FlameAudio.bgm.resume();
  }

  static void fadeInBgm() {
    double volume = 0.05;
    final stopwatch = Stopwatch()..start();
    Timer.periodic(const Duration(milliseconds: 200), (timer) {
      if (stopwatch.elapsed.inSeconds == 4) {
        timer.cancel();
        stopwatch.stop();
      }
      volume += 0.05;
      FlameAudio.bgm.audioPlayer?.setVolume(volume);
    });
  }

  static void fadeOutBgm() {
    double volume = 1;
    final stopwatch = Stopwatch()..start();
    Timer.periodic(const Duration(milliseconds: 200), (timer) {
      if (stopwatch.elapsed.inMilliseconds == 3600) {
        // Just making sure nothing is playing, no idea why stopBgm() is not working
        volume = 0.0;

        stopBgm();
        timer.cancel();
        stopwatch.stop();
      }
      volume -= 0.06;
      FlameAudio.bgm.audioPlayer?.setVolume(volume);
    });
  }
}
