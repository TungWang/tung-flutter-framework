import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:provider/provider.dart';
import 'package:tungflutterframework/services/api_services/providers/image_data_provider.dart';
import 'package:tungflutterframework/services/api_services/providers/login_provider.dart';

class UserProfileScreen extends StatefulWidget {
  @override
  _UserProfileScreenState createState() => _UserProfileScreenState();
}

class _UserProfileScreenState extends State<UserProfileScreen> {
  LoginProvider _loginProvider;
  ImageDataProvider _imageDataProvider;
  bool _isLoading = true;
  Uint8List _imageData;

  void _getProvider() {
    _loginProvider = Provider.of<LoginProvider>(context, listen: true);
    _imageDataProvider = Provider.of<ImageDataProvider>(context, listen: true);
  }

  void _fetchData() {
    _loginProvider
        .fetchUser(email: 'tongwang@viainno.com', password: 'winnie0607')
        .then((_) {
      _isLoading = _loginProvider.isLoading();
      _getImage(image: _loginProvider.getUser().theme.avatar);
    });
  }

  void _getImage({String image}) {
    var url =
        'https://spacesgoapi.azurewebsites.net/File/Download?fileGuid=%2B1_2_$image';
    _imageDataProvider.fetchImageData(url: url).then((_) {
      _imageData = _imageDataProvider.getImageData();
    });
  }

  @override
  void initState() {
    Future.delayed(Duration(milliseconds: 500), () {
      _fetchData();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    _getProvider();
    return ModalProgressHUD(
      inAsyncCall: _isLoading,
      child: Scaffold(
        body: Column(
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            Stack(
              alignment: Alignment.topCenter,
              children: <Widget>[
                Container(
                  height: 150.0,
                  decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(60.0),
                      bottomRight: Radius.circular(60.0),
                    ),
                  ),
                ),
                Column(
                  children: <Widget>[
                    SizedBox(
                      height: 60.0,
                    ),
                    CircleAvatar(
                      radius: 60,
                      backgroundImage:
                          _imageData == null ? null : MemoryImage(_imageData),
                    ),
                    Text(
                      _loginProvider.getUser().name,
                      style: TextStyle(
                          color: Theme.of(context).accentColor,
                          fontSize: 30.0,
                          fontWeight: FontWeight.w700),
                    ),
                    Text(
                      _loginProvider.getUser().email,
                      style: TextStyle(
                        color: Theme.of(context).accentColor,
                        fontSize: 24.0,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Expanded(
              child: Container(),
            ),
          ],
        ),
      ),
    );
  }
}
