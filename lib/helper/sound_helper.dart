import 'dart:math';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:get/get.dart';
class SoundHelper {
  static flutterTts({required String textToSpeak}) async {
    FlutterTts flutterTts = FlutterTts();
    // print(await flutterTts.getVoices);
   
    // await flutterTts.setVoice({"name": "Karen", "locale": '${L10n.all[0].languageCode}'});

    flutterTts.speak(textToSpeak);
    return flutterTts;
  }

  static playAudio(soundPath) {
    final audioPlayer = AudioPlayer();
    audioPlayer.play(AssetSource(soundPath));
  }
}
