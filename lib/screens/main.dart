import 'package:flutter/material.dart';
import 'package:tungflutterframework/api_services/album.dart';
import 'package:tungflutterframework/api_services/api_response_models/album_model.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Future<AlbumModel> album;

  void getAlbum() {
    album = Album().fetchAlbum();
  }

  @override
  void initState() {
    super.initState();
    getAlbum();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
    );
  }
}