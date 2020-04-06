import 'package:tungflutterframework/api_services/api_response_models/album_model.dart';

import 'networking.dart';
import 'dart:convert';

class Album {

  Future<AlbumModel> fetchAlbum() async {
    final response = await NetworkHelper(url: 'https://jsonplaceholder.typicode.com/albums/1').get();
    return AlbumModel.fromJson(response);
  }

}