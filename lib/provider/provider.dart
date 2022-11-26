import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:spotifywithapi/models/album_detail_model.dart';
import 'package:spotifywithapi/models/album_model.dart';
import 'package:spotifywithapi/models/artist_details_model.dart';
import 'package:spotifywithapi/models/artist_model.dart';
import 'package:spotifywithapi/models/my_playlist_model.dart';
import 'package:spotifywithapi/models/user_profile_model.dart';
import 'package:spotifywithapi/service/api_service.dart';

class GeneralViewModel with ChangeNotifier {
  ArtistsModel? artists;
  bool isLoadingArtistWithId = true;

  getArtistWithId() async {
    isLoadingArtistWithId = true;
    artists = await GeneralService().getArtistData();
    isLoadingArtistWithId = false;
    notifyListeners();
  }

  AlbumModel? albums;
  bool isLoadingAlbum = true;

  getAlbum() async {
    isLoadingAlbum = true;
    albums = await GeneralService().getAlbumData();
    isLoadingAlbum = false;
    notifyListeners();
  }

  AlbumDetailsModel? albumDetails;
  bool isLoadingAlbumDetail = true;

  getAlbumDetail() async {
    isLoadingAlbumDetail = true;
    albumDetails = await GeneralService().getAlbumDetailData();
    isLoadingAlbumDetail = false;
    notifyListeners();
  }

  ArtistDetailsModel? artistDetails;
  bool isLoadingArtistDetail = true;

  getArtistDetail() async {
    isLoadingArtistDetail = true;
    artistDetails = await GeneralService().getArtistDetailData();
    isLoadingArtistDetail = false;
    notifyListeners();
  }

  MyPlaylistModel? myPlaylist;
  bool isLoadingMyPlaylist = true;

  getMyPlaylist() async {
    isLoadingMyPlaylist = true;
    myPlaylist = await GeneralService().getMyPlaylist();
    isLoadingMyPlaylist = false;
    notifyListeners();
  }

  UserProfileModel? userProfile;
  bool isLoadingUserProfile = true;

  getUserProfile() async {
    isLoadingUserProfile = true;
    userProfile = await GeneralService().getUserProfile();
    isLoadingUserProfile = false;
    notifyListeners();
  }
}
