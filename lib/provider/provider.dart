import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:spotifywithapi/models/album_model.dart';
import 'package:spotifywithapi/models/artist_model.dart';
import 'package:spotifywithapi/service/api_service.dart';

class ArtistViewModel with ChangeNotifier {
  ArtistsModel? artists;

  bool isLoadingArtistWithId = true;

  getArtistWithId() async {
    isLoadingArtistWithId = true;
    artists = (await ArtistsService().getArtistData());
    isLoadingArtistWithId = false;
    notifyListeners();
  }
}

class AlbumsViewModel with ChangeNotifier {
  AlbumModel? albums;

  bool isLoadingAlbum = true;

  getAlbum() async {
    isLoadingAlbum = true;
    albums = (await AlbumService().getAlbumData());
    isLoadingAlbum = false;
    notifyListeners();
  }
}
