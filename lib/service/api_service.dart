import 'dart:convert';
import 'dart:developer';
import 'package:flutter/services.dart';
import 'package:dio/dio.dart';
import 'package:spotifywithapi/models/albums_ex.dart';

Future<List<AlbumsEx>?> getEczaneData(
    context, String sehir, String ilce) async {
  Map<String, String> requestHeaders = {
    'authorization':
        'Bearer BQAemIh4X2M6-NYfhUmlUEspsYEXDCFBYuGWjEazJvf4ZVAltqYlkiQiAXw94O3G4F2d3TM_3I__eqQjYrvAgumprR2UA0cEisfh8ANgQeb0XOFVe5LRPW5yOD24blZ2udv33RfAXHr4_CX0VaiXa7QQJpU-w8oHKES00mYdSb5PKL2VS0aGkvWs36qKwCuGZVgnRhCkcjWcyJrWEapHRWx_I7ZYC1-Dq946klxL8A0_kJe2C4MSNuONs22eIpr-HkhnJ0Pkb5Y7uT8ulyztKPW9LWY67KdL9wxGTC8DKiBO',
    'Content-type': 'application/json',
  };
  AlbumsEx spotifyResponse;
  Dio dio = Dio(BaseOptions(baseUrl: "https://api.spotify.com/v1/"));
  try {
    /* final response =await http.get(Uri.parse
    ("https://api.collectapi.com/health/dutyPharmacy?ilce=Çankaya&il=Ankara"), headers: requestHeaders);
    spotifyResponse = SpotifyList.fromJson(jsonDecode(response.body));*/

    final response = await dio.get("browse/categories",
        queryParameters: {
          'country': 'TR',
          'locale': 'tr_TR',
          'limit': '10',
          'offset': '5',
        },
        options: Options(headers: requestHeaders));
    print(response.data);

    List<dynamic> aa = response.data["categories"]["items"];

    List<AlbumsEx> sehirList =
        aa.map((ff) => AlbumsEx.fromJson(ff)).toList();

    return sehirList;
  } catch (e) {
    log(e.toString());
  }
  return null;
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