import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
import 'package:dezzer_app/models/album_model.dart';

class ApiProvider extends ChangeNotifier {
  Future<Album> getAlbums({int id}) async {
    Album album;
    String url = "https://api.deezer.com/album/$id";
    var response = await http.get(url);
    if (response.statusCode == 200) {
      var jsonData = jsonDecode(response.body);

      album = Album(
        id: jsonData['id'],
        image: jsonData['cover_medium'],
        fans: jsonData['fans'],
        name: jsonData['title'],
        imgArtist: jsonData['artist']['picture_medium'],
      );
    }
    return album;
  }

  Future<List<Album>> getSongs(int id) async {
    List<Album> songs = [];
    String url = "https://api.deezer.com/album/$id";
    var response = await http.get(url);
    if (response.statusCode == 200) {
      var jsonData = jsonDecode(response.body);
      var data = jsonData['tracks']['data'];
      for (var items in data) {
        Album album = Album(
          duration: items['duration'],
          mp3: items['preview'],
          songName: items['title'],
        );
        songs.add(album);
      }
    }
    return songs;
  }
}
