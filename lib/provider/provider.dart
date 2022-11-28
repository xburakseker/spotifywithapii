import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:spotifywithapi/models/album_detail_model.dart';
import 'package:spotifywithapi/models/album_model.dart';
import 'package:spotifywithapi/models/artist_details_model.dart';
import 'package:spotifywithapi/models/artist_model.dart';
import 'package:spotifywithapi/models/categories_detail_model.dart';
import 'package:spotifywithapi/models/categories_model.dart';
import 'package:spotifywithapi/models/my_playlist_model.dart';
import 'package:spotifywithapi/models/search_artist_model.dart';
import 'package:spotifywithapi/models/top_track_model.dart';
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

  CategoriesModel? categories;
  bool isLoadingCategories = true;

  getCategories() async {
    isLoadingCategories = true;
    categories = await GeneralService().getCategories();
    isLoadingCategories = false;
    notifyListeners();
  }

  CategoriesDetailModel? categoriesDetail;
  bool isLoadingCategoriesDetail = true;

  getCategoriesDetail() async {
    isLoadingCategoriesDetail = true;
    categoriesDetail = await GeneralService().getCategoriesDetail();
    isLoadingCategoriesDetail = false;
    notifyListeners();
  }

  TopTracksModel? topTrack;
  bool isLoadingTopTrack = true;

  getTopTrack() async {
    isLoadingTopTrack = true;
    topTrack = await GeneralService().getTopTracks();
    isLoadingTopTrack = false;
    notifyListeners();
  }

  SearchArtistModel? searchArtist;
  bool isLoadingSearchArtist = true;

  getSearchArtist(String? id) async {
    isLoadingSearchArtist = true;
    searchArtist = await GeneralService().getSearchArtist(id);
    if (searchArtist.runtimeType == SearchArtistModel) {
      isLoadingSearchArtist = false;
    }

    notifyListeners();
  }

  int selectedIndex = 0;
  void onItemTapped(int index) {
    selectedIndex = index;
    notifyListeners();
  }
}
