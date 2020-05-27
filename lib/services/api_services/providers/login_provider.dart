

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:tungflutterframework/services/api_services/api_response_models/login_model.dart';
import 'package:tungflutterframework/services/api_services/api_response_models/error_model.dart';
import 'package:tungflutterframework/services/api_services/api_response_models/user_model.dart';
import 'package:tungflutterframework/services/api_services/requests/login.dart';

class LoginProvider with ChangeNotifier {

  UserModel _user;
  List<ErrorModel> _errors;
  bool _loading;

  Future<bool> fetchUser({@required String email, @required String password, String fcm = ''}) async {
    _setLoading(true);

    await Login().login(email: email, password: password, fcm: fcm).then((data) {
      _setLoading(false);
      var loginModel = LoginModel.fromJson(json.decode(data.body));
      _setUser(loginModel.user.user);
      _setErrors(loginModel.errors);
    });

    return _isSuccess();
  }

  void _setLoading(bool value) {
    _loading = value;
    notifyListeners();
  }
  
  bool isLoading() {
    return _loading;
  }
  
  void _setUser(UserModel value) {
    _user = value;
    notifyListeners();
  }
  
  UserModel getUser() {
    return _user;
  }

  void _setErrors(List<ErrorModel> value) {
    _errors = value;
    notifyListeners();
  }

  List<ErrorModel> getError() {
    return _errors;
  }

  bool _isSuccess() {
    return _user != null;
  }
}