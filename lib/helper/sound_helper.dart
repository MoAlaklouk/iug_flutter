import 'dart:math';

import 'package:audioplayers/audioplayers.dart';
class SoundHelper {
  

  static playAudio(soundPath) {
    final audioPlayer = AudioPlayer();
    audioPlayer.play(AssetSource(soundPath));
  }
}
