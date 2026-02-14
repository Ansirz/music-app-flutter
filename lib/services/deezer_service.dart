import 'dart:convert';

import 'package:http/http.dart' as http;

import '../../models/song_model.dart';
class DeezerService {
  //String url = "https://api.deezer.com";
  Future<List<Result>> searchTracks(String url) async{
    try{
      final response = await http.get(
        Uri.parse("https://itunes.apple.com/search?term=drake&media=music&limit = 50"),
      //  headers:{ 'Accept': 'application/json'},
        );
      if (response.statusCode == 200){
        final jsonData = jsonDecode(response.body);
        final results = jsonData["results"] as List;
        return results
        .map((e) => Result.fromJson(e)).toList();
        
      }
      else{
        throw Exception("Failed to load tracks");
      }
    }
    catch(e){
      throw Exception("Failed to load tracks $e");
    }
  }
}