import 'package:assets_audio_player/assets_audio_player.dart';

class SoundManager {
  static AssetsAudioPlayer wrong = AssetsAudioPlayer.newPlayer()
    ..open(
      Audio("assets/sounds/wrong.mp3"),
      autoStart: false,
    );

  static AssetsAudioPlayer correct = AssetsAudioPlayer.newPlayer()
    ..open(
      Audio("assets/sounds/correct.mp3"),
      autoStart: false,
    );

  static AssetsAudioPlayer levelCompleted = AssetsAudioPlayer.newPlayer()
    ..open(
      Audio("assets/sounds/level_completed.mp3"),
      autoStart: false,
    );

  static void playWrong() {
    wrong.play();
  }

  static void playCorrect() {
    correct.play();
  }

  static void playLevelCompleted() {
    levelCompleted.play();
  }
}
