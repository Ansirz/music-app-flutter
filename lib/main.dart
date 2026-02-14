import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';
import 'package:music_visualization_app/audio_player/music_player.dart';
//import 'package:music_visualization_app/models/song_model.dart';
import 'package:music_visualization_app/pages/Track_details_screen.dart';

//import 'package:music_visualization_app/providers/deezer_provider.dart';
import 'package:music_visualization_app/providers/tracks_provider.dart';

void main() {
  runApp(
    ProviderScope(child: MaterialApp(
      routes: {
        "/trackDetails": (context) => TrackDetails()
      },
      debugShowCheckedModeBanner: false,
      home: MusicApp(),
    ))
  );
}
class MusicApp extends ConsumerStatefulWidget {
   const MusicApp({super.key});

  @override
  ConsumerState<MusicApp> createState() => _MusicAppState();
}

class _MusicAppState extends ConsumerState<MusicApp> {
final ScrollController scrollController = ScrollController();
final MusicPlayer musicPlayer = MusicPlayer();
final  boolProvider = StateProvider<bool>((Ref ref){
  return false;
});
var isPlaying = false;
  @override
  Widget build(BuildContext context) {
    TextEditingController searchController =TextEditingController();
    final tracksAsync = ref.watch(tracksProvider);
   // var isPlaying = ref.watch(boolProvider);
    return Container(
      decoration: const BoxDecoration(
        image:DecorationImage(image: 
        AssetImage("assets/music_2.jpg"),
        fit: BoxFit.cover
        )
      ),
      child: Scaffold(
      backgroundColor: Colors.transparent,
        appBar: AppBar(

          backgroundColor: Colors.transparent,
          title: Text(
            "Heavenly",
            style: TextStyle(
              color: Colors.white,
              letterSpacing: 1.5
            ),
          ),
          actions: [
           SizedBox(
            width: 350.0,
             child: TextField(
              
  
              style: TextStyle(
                color: Colors.white
              ),
                  decoration: InputDecoration(
                    hintText: "Search for music",
                    hintStyle: TextStyle(
                      color: const Color.fromARGB(148, 33, 149, 243)
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30.0),
                      borderSide: BorderSide(
                        color: Colors.purple
                        
                      )
                    ),
                    suffixIcon: Icon(
                      Icons.search,
                      color: Colors.blue,
                    )
                  ),
                
              ),
           ),
            
          ],
        ),
        body:
            
            Padding(
            padding: EdgeInsets.all(2.0),
            child: tracksAsync.when(
              data: (tracks) {
                return ListView.builder(
                  
                  controller: scrollController,
                  itemCount: tracks.length,
                  itemBuilder: (context, index){
                    final track = tracks[index];
                    return Padding(
                      padding: const EdgeInsets.all(7.0),
                      child: GestureDetector(
                        onTap: () {
                      musicPlayer.playMusic(track.previewUrl);
                    Navigator.pushNamed(context, "/trackDetails",
                    arguments: track
                    );
                      },
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                            color: const Color.fromARGB(83, 158, 158, 158)
                          ),
                          child: ListTile(
                           contentPadding: EdgeInsets.all(8.0),
                            trailing: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                 IconButton(
                                  onPressed: (){
                                //  ref.read(boolProvider.notifier).state = !ref.read(boolProvider.notifier).state;
                                //  if (isPlaying){
                                    musicPlayer.stopMusic(track.previewUrl);
                                    
                                //  }
                                  //else {
                                //    musicPlayer.stopMusic(track.previewUrl);
                                  //}
                                  }, 
                                  icon: const Icon(
                                  Icons.pause,
                                  color: Colors.white,
                                  )),
                                IconButton(
                                  
                                  onPressed: (){
                                //  ref.read(boolProvider.notifier).state = !ref.read(boolProvider.notifier).state;
                                //  if (isPlaying){
                                    musicPlayer.playMusic(track.previewUrl);
                                    
                                //  }
                                  //else {
                                //    musicPlayer.stopMusic(track.previewUrl);
                                  //}
                                  }, 
                                  icon: const Icon(
                                     color: Colors.white,
                                  
                                  Icons.play_arrow
                                  )),
                              ],
                            ),
                            leading: ClipRRect(
                              borderRadius: BorderRadius.circular(10.0),
                              child: Image.network(
                                track.artworkUrl60
                              ),
                            ),
                            title:Text(
                              
                              track.trackName,
                              style: TextStyle(
                                 color: Colors.white,
                              ),
                            ) ,
                            
                          ),
                        ),
                      ),
                    );
                  });
              }, 
              error: (err, _) =>  throw("An error occured $err"),
               loading: () => CircularProgressIndicator())),
        
        floatingActionButton: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            FloatingActionButton(
              backgroundColor: Colors.black87,
                   mini: true,
        shape:CircleBorder(),
              child: Icon(
                Icons.arrow_upward,
                color: Colors.blue[800],
              ),
              onPressed: (){
              scrollController.animateTo(
                scrollController.position.minScrollExtent,
                duration: Duration(
                  seconds: 2
                ),
                curve: Curves.easeIn
                )
                
                ;
            }
            
            ),
            SizedBox(
              height: 20.0,
            ),
           
            
          ],
        ),
      ),
    );
  }
}
