import 'dart:developer';
import 'package:dio/dio.dart';
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

class GeneralService {
  Dio dio = Dio(BaseOptions(baseUrl: "https://api.spotify.com/v1/"));
  Map<String, String> requestHeaders = {
    'authorization':
        'Bearer BQC9ozdlWl2WNFicABpFOfGMwSNpwKeFwrM6cPROvnROKft0Uz6c9FMpNfReQU2T0r5k7HBoKu0vQXUXvyqdnzO2YBubBZ1nqC2YLfrWifGJ2fN08EONcNvoWL8j0rHi9tef4ssOx1IrK1QLYP75ZpsQyEatMtybhQgvE0UYapFWD84_stqJI6hdB3FP-39PUYn2xAGdbvA503yQOJtUKHgrit-FmnqjS-QUG6jE25fJjxawVXMxlEFhvr7VpZMakLepWHLjHC0fBrkU_eYpYcGCHfF0OptAFFoDLkEGl0Vx',
    'Content-type': 'application/json',
    'Accept': 'application/json'
  };

  Future<ArtistsModel?> getArtistData() async {
    try {
      final response = await dio.get("artists",
          queryParameters: {
            'ids':
                '2CIMQHirSU0MQqyYHq0eOx,57dN52uHvrHOxijzpIgu3E,1vCWHaC5f2uS3yhpwWbIA6',
          },
          options: Options(headers: requestHeaders));
      return ArtistsModel.fromJson(response.data);
    } catch (e) {
      log(e.toString());
    }
    return null;
  }

  Future<AlbumModel?> getAlbumData() async {
    try {
      final response = await dio.get("albums",
          queryParameters: {
            'ids':
                '382ObEPsp2rxGrnsizN5TX,1A2GTWGtFfWp7KSQTwWOyo,2noRn2Aes5aoNVsU6iWThc',
          },
          options: Options(headers: requestHeaders));
      return AlbumModel.fromJson(response.data);
    } catch (e) {
      log(e.toString());
    }
    return null;
  }

  Future<AlbumDetailsModel?> getAlbumDetailData() async {
    try {
      final response =
          await dio.get("artists/0TnOYISbd1XYRBk9myaseg/top-tracks",
              queryParameters: {
                'market': 'ES',
              },
              options: Options(headers: requestHeaders));
      return AlbumDetailsModel.fromJson(response.data);
    } catch (e) {
      log(e.toString());
    }
    return null;
  }

  Future<ArtistDetailsModel?> getArtistDetailData() async {
    try {
      final response = await dio.get("artists/0TnOYISbd1XYRBk9myaseg",
          options: Options(headers: requestHeaders));
      return ArtistDetailsModel.fromJson(response.data);
    } catch (e) {
      log(e.toString());
    }
    return null;
  }

  Future<MyPlaylistModel?> getMyPlaylist() async {
    try {
      final response = await dio.get("me/playlists",
          queryParameters: {
            'limit': '10',
            'offset': '5',
          },
          options: Options(headers: requestHeaders));
      return MyPlaylistModel.fromJson(response.data);
    } catch (e) {
      log(e.toString());
    }
    return null;
  }

  Future<UserProfileModel?> getUserProfile() async {
    try {
      final response =
          await dio.get("me", options: Options(headers: requestHeaders));
      return UserProfileModel.fromJson(response.data);
    } catch (e) {
      log(e.toString());
    }
    return null;
  }

  Future<CategoriesModel?> getCategories() async {
    try {
      final response = await dio.get("browse/categories",
          queryParameters: {
            'country': 'SE',
            'locale': 'sv_SE',
            'limit': '10',
            'offset': '5',
          },
          options: Options(headers: requestHeaders));
      return CategoriesModel.fromJson(response.data);
    } catch (e) {
      log(e.toString());
    }
    return null;
  }

  Future<CategoriesDetailModel?> getCategoriesDetail() async {
    try {
      final response =
          await dio.get("browse/categories/0JQ5DAqbMKFEZPnFQSFB1T/playlists",
              queryParameters: {
                'country': 'SE',
                'limit': '10',
                'offset': '5',
              },
              options: Options(headers: requestHeaders));
      return CategoriesDetailModel.fromJson(response.data);
    } catch (e) {
      log(e.toString());
    }
    return null;
  }

  Future<TopTracksModel?> getTopTracks() async {
    try {
      final response =
          await dio.get("artists/0TnOYISbd1XYRBk9myaseg/top-tracks",
              queryParameters: {
                'market': 'TR',
              },
              options: Options(headers: requestHeaders));
      return TopTracksModel.fromJson(response.data);
    } catch (e) {
      log(e.toString());
    }
    return null;
  }

  Future<SearchArtistModel?> getSearchArtist(String artistName) async {
    try {
      final response = await dio.get("search",
          queryParameters: {
            'q': artistName,
            'type': 'track,artist',
            'market': 'TR',
            'limit': '10',
            'offset': '5',
          },
          options: Options(headers: requestHeaders));
      return SearchArtistModel.fromJson(response.data);
    } catch (e) {
      log(e.toString());
    }
    return null;
  }
}
