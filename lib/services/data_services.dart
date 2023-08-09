import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

import '../models/data_models.dart';

class DataServices {
  String baseUrl = 'http://127.0.0.1:8000/api/';

  Future<List<Place>> getInfo() async {
    var apiUrl = 'places/';
    http.Response response = await http.get(Uri.parse(baseUrl + apiUrl));

    List<Place> places = [];

    try {
      if (response.statusCode == 200) {
        List<dynamic> list = json.decode(response.body);
        places = list.map((e) => Place.fromJson(e)).toList();
      }
    } catch (e) {
      if (kDebugMode) {
        print('error because serveur');
      }
    }
    return places;
  }

  Future<Place> getInfoInDetail(int id) async {
    var apiUrl = 'places/$id/';
    http.Response response = await http.get(Uri.parse(baseUrl + apiUrl));

    Place place=Place();

    try {
      if (response.statusCode == 200) {
        Map<String, dynamic> placeMap = json.decode(response.body);
        place=Place.fromJson(placeMap);
      }
    } catch (e) {
      if (kDebugMode) {
        print('error because serveur');
      }
    }
    return place;
  }
}
