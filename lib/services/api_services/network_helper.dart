import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

class NetworkHelper {

  Future<http.Response> get( {@required String url} ) async {
    return http.get(url);
  }

  Future<http.Response> post({@required String url, @required String body}) async {

    Map<String, String> headers = {
      'Content-type': 'application/json',
      'X-APPLICATION': 'SpacesCompanion',
      'X-PLATFORM': 'Ios'
    };

    return http.post(url, headers: headers, body: body);
  }
}
