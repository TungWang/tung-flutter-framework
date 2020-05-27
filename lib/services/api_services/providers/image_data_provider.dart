import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:tungflutterframework/services/api_services/network_helper.dart';

class ImageDataProvider with ChangeNotifier {

  Uint8List _imageData;
  String _message;
  bool _loading = false;

  Future<bool> fetchImageData({@required String url}) async {
    setLoading(true);
    var response = await NetworkHelper().get(url: url);
    setLoading(false);
    if (response.statusCode == 200) {
      _imageData = response.bodyBytes;
      setMessage(null);
    }else{
      setMessage(response.body);
    }
    return isSuccess();
  }

  void setLoading(bool value) {
    _loading = value;
    notifyListeners();
  }

  bool isLoading() {
    return _loading;
  }

  Uint8List getImageData() => _imageData;

  void setImageData(Uint8List value) {
    _imageData = value;
  }

  String getMessage() => _message;

  void setMessage(String value) {
    _message = value;
  }

  bool isSuccess() => _imageData != null;
}