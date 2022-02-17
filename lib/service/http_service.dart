import 'dart:convert';

import 'package:http/http.dart';

import '../model/photo_model.dart';

class HttpService {
  // Base url
  static String BASE_URL = "jsonplaceholder.typicode.com";

  // Header
  static Map<String, String> headers = {
    'Content-type': 'application/json; charset=UTF-8',
  };

  // Apis
  static String API_PHOTO_LIST = "/photos";

  // Methods
  static Future<String?> GET(String api, Map<String, dynamic> params) async {
    var uri = Uri.https(BASE_URL, api, params);
    Response response = await get(uri, headers: headers);
    if (response.statusCode == 200) {
      return response.body;
    }
    return null;
  }

  // Params
  static Map<String, String> paramEmpty() {
    Map<String, String> map = {};
    return map;
  }

  static PhotoList parsePhotoList(String body) {
    List json = jsonDecode(body);
    PhotoList list = PhotoList.fromJson(json);
    return list;
  }

  static Photo parseUserOne(String body) {
    Map<String, dynamic> json = jsonDecode(body);
    Photo photo = Photo.fromJson(json);
    return photo;
  }
}
