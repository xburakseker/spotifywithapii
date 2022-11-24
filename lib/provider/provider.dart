import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:spotifywithapi/models/albums_ex.dart';
import 'package:spotifywithapi/service/api_service.dart';

class AlbumsViewModel with ChangeNotifier {
  AlbumsEx? artists;

  bool isLoadingArtistWithId = true;

  getArtistWithId() async {
    isLoadingArtistWithId = true;
    artists = (await Albums().getArtistData());
    isLoadingArtistWithId = false;
    notifyListeners();
  }
}
