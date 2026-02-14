import 'package:just_audio/just_audio.dart';
class MusicPlayer {
    final player = AudioPlayer();
  Future<void> playMusic(String url) async{
    player.stop();
    await player.setUrl(url);
    player.play();
  }
Future<void> stopMusic(String url) async{
  await player.stop();
}
}
