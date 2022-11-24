import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:spotifywithapi/models/albums_ex.dart';
import 'package:spotifywithapi/service/api_service.dart';

class AlbumsViewModel with ChangeNotifier {
  ArtistsModel? artists;

  bool isLoadingArtistWithId = true;

  getArtistWithId() async {
    isLoadingArtistWithId = true;
    artists = (await ArtistsService().getArtistData());
    print(artists!.artists![0].images![0].url);
    isLoadingArtistWithId = false;
    notifyListeners();
  }
}
