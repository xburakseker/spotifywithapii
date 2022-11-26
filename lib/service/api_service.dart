import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:spotifywithapi/models/album_detail_model.dart';
import 'package:spotifywithapi/models/album_model.dart';
import 'package:spotifywithapi/models/artist_details_model.dart';
import 'package:spotifywithapi/models/artist_model.dart';
import 'package:spotifywithapi/models/my_playlist_model.dart';
import 'package:spotifywithapi/models/user_profile_model.dart';

class GeneralService {
  Dio dio = Dio(BaseOptions(baseUrl: "https://api.spotify.com/v1/"));

  Map<String, String> requestHeaders = {
    'authorization':
        'Bearer BQCIftmq0JgUrMQX8XuwqpF3PTdoAntHExCrARMxHOQv3EUkYzgp7AP2sTkJgoS_DT2WMd-oQob7mmZ8VFFDYjtdzoMqlOMQXUR2yvMBRWDTvH7t0zwx9qQTPNn3k-g2bAETABRdHFNdtzU2v4lyw6m21C483XPsRyYSKahC2pNbslDap-7VhqrSlMFx2-5D-mqZuKBK9RIeeU40-i4rgldYZxuHFgnpaAmKMrfVPkWhRkpTwsNxEqNExtkMjnlndl6SU3vwXbjLw7jaLqd9mG0xlyL5OtK1I7Rzw9njnnZF',
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
}
