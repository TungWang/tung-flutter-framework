import 'package:flutter/cupertino.dart';
import '../network_helper.dart';
import 'package:tungflutterframework/constans.dart';
import 'package:http/http.dart' as http;

class Login {

  final NetworkHelper _networkHelper = NetworkHelper();

  Future<http.Response> login({@required String email, @required String password, @required String fcm}) {
    final String body = '{"email":"$email", "password":"$password", "fcm":"$fcm"}' ;
    final String url = '$kViainnoUrl/user/Login';
    return _networkHelper.post(url: url, body: body);
  }

}