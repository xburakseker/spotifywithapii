import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:spotifywithapi/models/album_detail_model.dart';
import 'package:spotifywithapi/models/album_id_model.dart';
import 'package:spotifywithapi/models/album_model.dart';
import 'package:spotifywithapi/models/artist_details_model.dart';
import 'package:spotifywithapi/models/artist_model.dart';
import 'package:spotifywithapi/models/artist_with_album_model.dart';
import 'package:spotifywithapi/models/artist_with_id_model.dart';
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

  getCategoriesDetail(String? id) async {
    isLoadingCategoriesDetail = true;
    categoriesDetail = await GeneralService().getCategoriesDetail(id);
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
    print(searchArtist!.artists!.items![1].id);

    isLoadingSearchArtist = false;

    notifyListeners();
  }

  AlbumIdModel? albumId;
  bool isLoadingAlbumId = true;

  getAlbumId(String? id) async {
    isLoadingAlbumId = true;
    albumId = await GeneralService().getAlbumId(id);

    isLoadingAlbumId = false;

    notifyListeners();
  }

  ArtistWithAlbumModel? artistWithAlbum;
  bool isLoadingArtistWithAlbum = true;

  getArtistWithAlbum(String? id) async {
    isLoadingArtistWithAlbum = true;
    artistWithAlbum = await GeneralService().getArtistWithAlbum(id);

    isLoadingArtistWithAlbum = false;

    notifyListeners();
  }

  ArtistWithIdModel? artistWithId;
  bool isLoadingArtistWithIdd = true;

  getArtistWithIdd(String? id) async {
    isLoadingArtistWithIdd = true;
    artistWithId = await GeneralService().getArtistWithId(id);

    isLoadingArtistWithIdd = false;

    notifyListeners();
  }

  int selectedIndex = 0;
  void onItemTapped(int index) {
    selectedIndex = index;
    notifyListeners();
  }
}
