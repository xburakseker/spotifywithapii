import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:spotifywithapi/models/album_detail_model.dart';
import 'package:spotifywithapi/models/album_id_model.dart';
import 'package:spotifywithapi/models/album_model.dart';
import 'package:spotifywithapi/models/artist_details_model.dart';
import 'package:spotifywithapi/models/artist_id_album_model.dart';
import 'package:spotifywithapi/models/artist_id_top_tracks_model.dart';
import 'package:spotifywithapi/models/artist_model.dart';
import 'package:spotifywithapi/models/artist_with_album_model.dart';
import 'package:spotifywithapi/models/artist_with_id_model.dart';
import 'package:spotifywithapi/models/categories_detail_model.dart';
import 'package:spotifywithapi/models/categories_model.dart';
import 'package:spotifywithapi/models/my_playlist_model.dart';
import 'package:spotifywithapi/models/search_artist_model.dart';
import 'package:spotifywithapi/models/top_track_model.dart';
import 'package:spotifywithapi/models/user_profile_model.dart';

class GeneralService {
  Dio dio = Dio(BaseOptions(baseUrl: "https://api.spotify.com/v1/"));
  static const Map<String, String> requestHeaders = {
    'authorization':
        'Bearer BQB9PzimJezej15Nyimh8e-AQzAmrbBfx7UTbBPTOuNbSzifGa8LF_uYAJ4-iGNcKEuMqfJHS_d9D2fu_zofYIgR2uRWHUmLR89buHOJ7T5qDU8XtdYj1CcmiMAPa_xaDTFudBRl9Bc1z_SIzMMu2qFOsmQENAlmcIyTOVGnsD8pMiNc1fGdXHPqXa5eDTIhmCziyOAm04bKVHoaHuxYieQ_23kB4ppjjQCm7-5ZjnocyWHDKJCM7p7pvYVQmazaHR5ACjLj4X8rtA7LX3jBNlYVuP8nXzvh78FAvTMMAnvT',
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

  Future<CategoriesDetailModel?> getCategoriesDetail(String? id) async {
    try {
      final response = await dio.get("browse/categories/$id/playlists",
          queryParameters: {
            'country': 'SE',
            'limit': '10',
            'offset': '5',
          },
          options: Options(headers: requestHeaders));
      print(response.data);
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

  Future<SearchArtistModel?> getSearchArtist(String? id) async {
    try {
      final response = await dio.get("search",
          queryParameters: {
            'q': id,
            'type': 'track,artist',
            'market': 'TR',
            'limit': '10',
            'offset': '0',
          },
          options: Options(headers: requestHeaders));
      print("ok");
      return SearchArtistModel.fromJson(response.data);
    } catch (e) {
      log(e.toString());
    }
    return null;
  }

  Future<AlbumIdModel?> getAlbumId(String? id) async {
    try {
      final response = await dio.get("search",
          queryParameters: {
            'q': id,
            'market': 'TR',
          },
          options: Options(headers: requestHeaders));
      return AlbumIdModel.fromJson(response.data);
    } catch (e) {
      log(e.toString());
    }
    return null;
  }

  Future<ArtistWithAlbumModel?> getArtistWithAlbum(String? id) async {
    try {
      final response = await dio.get("artists/$id/albums",
          queryParameters: {
            'q': id,
            'include_groups': 'single,appears_on',
            'market': 'ES',
            'limit': '10',
            'offset': '0',
          },
          options: Options(headers: requestHeaders));
      return ArtistWithAlbumModel.fromJson(response.data);
    } catch (e) {
      log(e.toString());
    }
    return null;
  }

  Future<ArtistWithIdModel?> getArtistWithIdd(String? id) async {
    try {
      final response = await dio.get("artists/$id",
          queryParameters: {
            'q': id,
          },
          options: Options(headers: requestHeaders));
      return ArtistWithIdModel.fromJson(response.data);
    } catch (e) {
      log(e.toString());
    }
    return null;
  }

  Future<ArtistIdAlbumModel?> getArtistIdAlbum(String? id) async {
    try {
      final response = await dio.get("artists/$id/albums",
          queryParameters: {
            'q': id,
            'include_groups': 'single,appears_on',
            'market': 'TR',
            'limit': '10',
            'offset': '5',
          },
          options: Options(headers: requestHeaders));
      return ArtistIdAlbumModel.fromJson(response.data);
    } catch (e) {
      log(e.toString());
    }
    return null;
  }

  Future<ArtistIdTopTracksModel?> getArtistIdTopTrack(String? id) async {
    try {
      final response = await dio.get("artists/$id/top-tracks",
          queryParameters: {
            'q': id,
            'market': 'TR',
          },
          options: Options(headers: requestHeaders));
      return ArtistIdTopTracksModel.fromJson(response.data);
    } catch (e) {
      log(e.toString());
    }
    return null;
  }
}
