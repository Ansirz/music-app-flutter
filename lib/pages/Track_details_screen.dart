import 'package:flutter/material.dart';
import 'package:music_visualization_app/audio_player/music_player.dart';
import 'package:music_visualization_app/models/song_model.dart';
//import 'package:music_visualization_app/models/song_model.dart';
class TrackDetails extends StatefulWidget {

 const TrackDetails({
    super.key,
  
    });

  @override
  State<TrackDetails> createState() => _TrackDetailsState();
}

class _TrackDetailsState extends State<TrackDetails> {
  final MusicPlayer song = MusicPlayer();
  @override
  Widget build(BuildContext context) {
    final track = ModalRoute.of(context)!.settings.arguments as Result;
    return Container(
      decoration:BoxDecoration(
        image: DecorationImage(image: AssetImage(
          "assets/music_3.jpg",
          
        ),
        fit: BoxFit.cover)
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          foregroundColor: Colors.pink,
        ),
      body: Center(
        child: Column(
          children: [
            
              ClipRRect(
                borderRadius: BorderRadius.circular(12.0),
                child: Image.network(
                  
                  track.artworkUrl60.replaceAll("60x60", "600x600"),
                  filterQuality: FilterQuality.high,
                  width: 400.0,
                  height: 400.0,
                 fit: BoxFit.cover,
                  ),
              ),
            
           
            Text(
                track.trackName,
                style: TextStyle(
                  fontSize: 25.0,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1.3
                ),
              ),
            
          
          Text(
                
                track.artistName,
                style: TextStyle(
                  fontSize: 15.0,
                color: Colors.white,
                  letterSpacing: 1.3
                ),
              ),
            SizedBox(
              height: 20.0,
            ),
          
          ],
        ),
      ),
        
      ),
    );
  }
}