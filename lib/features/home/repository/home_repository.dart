import 'dart:convert';

import 'package:flutter_wallpaper_app/common/utils/api_key.dart';
import 'package:flutter_wallpaper_app/models/response_model.dart';
import 'package:http/http.dart' as http;

class HomeRepository {
  Future<http.Response> fetchAlbum() {
    return http.get(Uri.parse(apiKey));
  }

  Future<List<Photos>?> fetchPhotos() async {
    final response = await http.get(
        Uri.parse("https://api.pexels.com/v1/curated?page=5&per_page=40"),
        headers: {
          "Authorization": apiKey,
        });
    List<Photos>? photoList;
    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      var model = ResponseModel.fromJson(data);
      photoList = model.photos;
      print(photoList!.length);
      return photoList;
    } else {
      // Handle the error
    }
    return photoList;
  }
}
