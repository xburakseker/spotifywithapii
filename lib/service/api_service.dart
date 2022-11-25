import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:spotifywithapi/models/album_model.dart';
import 'package:spotifywithapi/models/artist_model.dart';

class ArtistsService {
  Future<ArtistsModel?> getArtistData() async {
    Map<String, String> requestHeaders = {
      'authorization':
          'Bearer BQBHKsVWrurRprzgy6FojjNDFq8wx7neWf3cy5lmP2fROn4MkZr-ySNepSUqinyEkGr_ERv_PBulZUAJZWdK5NwqWZtzjmEfm5rPs79vpIdSiIDEN0oWwlm1oa27OHE8HOrwqSzSWrAzmflXQEpP3Y8sNfK_FzDxoctyOfMSHyjMI7q-eCc9YaQ9T4eXOAoq9Mvne6ev6WNxJ7mB3NiHQPXSWthUg900XMIU5aJyFgSIZ7sCzq15-Hx5BvaWTFkO-fQKnJcui797zzebGy_IEwlvY3N1RDh1lXSVlj-OvwHN',
      'Content-type': 'application/json',
    };

    Dio dio = Dio(BaseOptions(baseUrl: "https://api.spotify.com/v1/"));
    try {
      final response = await dio.get("artists",
          queryParameters: {
            'ids':
                '2CIMQHirSU0MQqyYHq0eOx,57dN52uHvrHOxijzpIgu3E,1vCWHaC5f2uS3yhpwWbIA6',
            'Accept': 'application/json',
          },
          options: Options(headers: requestHeaders));
      return ArtistsModel.fromJson(response.data);
    } catch (e) {
      log(e.toString());
    }
    return null;
  }
}

class AlbumService {
  Future<AlbumModel?> getAlbumData() async {
    Map<String, String> requestHeaders = {
      'authorization':
          'Bearer BQBHKsVWrurRprzgy6FojjNDFq8wx7neWf3cy5lmP2fROn4MkZr-ySNepSUqinyEkGr_ERv_PBulZUAJZWdK5NwqWZtzjmEfm5rPs79vpIdSiIDEN0oWwlm1oa27OHE8HOrwqSzSWrAzmflXQEpP3Y8sNfK_FzDxoctyOfMSHyjMI7q-eCc9YaQ9T4eXOAoq9Mvne6ev6WNxJ7mB3NiHQPXSWthUg900XMIU5aJyFgSIZ7sCzq15-Hx5BvaWTFkO-fQKnJcui797zzebGy_IEwlvY3N1RDh1lXSVlj-OvwHN',
      'Content-type': 'application/json',
    };

    Dio dio = Dio(BaseOptions(baseUrl: "https://api.spotify.com/v1/"));
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
}
