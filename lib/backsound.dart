import 'package:audioplayers/audioplayers.dart';

class AudioManager {
  AudioPlayer _audioPlayer = AudioPlayer();

  AudioManager() {
    _setupAudio();
  }

  void _setupAudio() async {
    await _audioPlayer.setSourceAsset('audio/backsound.mp3');
    await _audioPlayer.setVolume(0.1);
    await _audioPlayer.setReleaseMode(ReleaseMode.loop);
    await _audioPlayer.resume();
  }

  void start() async {
    await _audioPlayer.resume();
  }

  void pause() async {
    await _audioPlayer.pause();
  }

  void resume() async {
    await _audioPlayer.resume();
  }

  void stop() async {
    await _audioPlayer.stop();
  }
}
