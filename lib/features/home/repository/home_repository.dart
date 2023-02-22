import 'dart:convert';

import 'package:flutter_wallpaper_app/common/utils/api_key.dart';
import 'package:flutter_wallpaper_app/models/photo_model.dart';
import 'package:http/http.dart' as http;

class HomeRepository {
  PhotoModels? item;
  Future<http.Response> fetchAlbum() {
    return http.get(Uri.parse(apiKey));
  }

  Future<PhotoModels> fetchPhotos() async {
    var headers = {
      'Authorization':
          '563492ad6f917000010000019dcc48df08bc4c60b6ce013ea1a31373',
      'Cookie':
          '__cf_bm=rwRoMgur1.FLYhmv.Hc8j3Dj.GwJg2yMbODEu_gdSaI-1677013379-0-AV5jl7uS6tUTFsskI85ebwinw1TL7FmjtslorLHHcJV5O2vBd5j8GZRb/HsvgFEKR2tq77Ln4BDtf5livwodiII='
    };
    var uri = Uri.parse("https://api.pexels.com/v1/curated?page=1&per_page=4");
    var response = await http.get(uri, headers: headers);
    print(response.statusCode);

    if (response.statusCode == 200) {
      var decodedValue = jsonDecode(response.body);
      print(decodedValue);
      return item = PhotoModels.fromJson(decodedValue);
      // print(item.photos[0].id);
    } else {
      return item = PhotoModels.fromJson({});
      print(response.reasonPhrase);
    }
  }
}
