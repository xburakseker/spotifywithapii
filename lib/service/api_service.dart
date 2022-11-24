import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:spotifywithapi/models/albums_ex.dart';

class ArtistsService {
  Future<ArtistsModel?> getArtistData() async {
    Map<String, String> requestHeaders = {
      'authorization':
          'Bearer BQDRiNu1QRVsUy91Ltag0fnzG9UmRGG9LeSSbP5TpC3957nzgDs-O2vWy4rNO9BHw5Qd1RW4rFjtgofcxYpvDsela0_OZQjVkBvmVtFX2RBaXLGyPkDqfVN2rhMb-CFs803EXkDV9ilClo047xjR9H7o7bqr6lP_1LdaWs03IAKidf8Mas2_OKM5_sQ47RKGEnW3KC-2E84fsMp_8Cku_8B-wZJwQY1QoyRtxOV2-eAPkSYgDYom4wR8BBgKwkqK5FexZ4CjGxmWVRFxAWRiDAXzG7X15fSu49FBEnSLK-T7',
      'Content-type': 'application/json',
    };

    Dio dio = Dio(BaseOptions(baseUrl: "https://api.spotify.com/v1/"));
    try {
      /* final response =await http.get(Uri.parse
    ("https://api.collectapi.com/health/dutyPharmacy?ilce=Çankaya&il=Ankara"), headers: requestHeaders);
    spotifyResponse = SpotifyList.fromJson(jsonDecode(response.body));*/

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



/* getSehirData (context) async {
  try {
      var dummyData = await rootBundle.loadString("assets/sehir_liste.json");
   List<dynamic> aa=   json.decode(dummyData)["data"];
   

  List<SehirListe> sehirList = aa.map((user) =>   SehirListe.fromJson(user)).toList();
    return sehirList;
  } catch (e) {
    
  }
} */