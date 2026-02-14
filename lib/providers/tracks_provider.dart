

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:music_visualization_app/models/song_model.dart';
import 'package:music_visualization_app/providers/deezer_provider.dart';

final tracksProvider = FutureProvider<List<Result>>((Ref ref)async{
  final service = ref.read(trackProvider);
  return await service.searchTracks("pop");
});