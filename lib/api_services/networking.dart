import 'package:http/http.dart' as http;
import 'package:flutter/cupertino.dart';
import 'dart:convert';

class NetworkHelper {
  NetworkHelper({@required this.url});

  final String url;

  Future get() async {
    http.Response response = await http.get(url);

    if (response.statusCode == 200) {
      String data = response.body;

      return jsonDecode(data);
    } else {
      print(response.statusCode);
    }
  }

  Future post(String body) async {

    Map<String, String> headers = {
      'Content-type': 'application/json',
      'X-APPLICATION': 'SpacesCompanion',
      'X-PLATFORM': 'Ios'
    };

    http.Response response = await http.post(url, headers: headers, body: body);

    if (response.statusCode == 200) {
      String data = response.body;

      return jsonDecode(data);
    } else {
      String data = response.body;
      return jsonDecode(data);
    }
  }
}
