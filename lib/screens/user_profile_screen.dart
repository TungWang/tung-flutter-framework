import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:provider/provider.dart';
import 'package:tungflutterframework/services/api_services/api_response_models/user_model.dart';
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
  UserModel _user = UserModel();

  void _getProvider() {
    _loginProvider = Provider.of<LoginProvider>(context, listen: true);
    _imageDataProvider = Provider.of<ImageDataProvider>(context, listen: true);
  }

  void _fetchData() {
    _loginProvider
        .fetchUser(email: 'tongwang@viainno.com', password: 'winnie0607')
        .then((_) {
      _isLoading = _loginProvider.isLoading();
      _user = _loginProvider.getUser();
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
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.menu),
            onPressed: () {},
          ),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.notifications),
              onPressed: () {},
            ),
          ],
          title: Text('Viainno'),
          backgroundColor: Colors.transparent,
          elevation: 0.0,
        ),
        extendBodyBehindAppBar: true,
        body: Stack(
          alignment: Alignment.topCenter,
          children: <Widget>[
            Container(
              height: 300.0,
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(60.0),
                  bottomRight: Radius.circular(60.0),
                ),
              ),
            ),
            SafeArea(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              _user.name ?? '',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.w700),
                            ),
                            Text(
                              _user.email ?? '',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18.0,
                              ),
                            ),
                          ],
                        ),
                        Container(
                          child: CircleAvatar(
                            backgroundImage: _imageData == null
                                ? null
                                : MemoryImage(_imageData),
                          ),
                          height: 70,
                          width: 70,
                          decoration: BoxDecoration(
                            border: Border.all(
                              width: 2.0,
                              color: Colors.white,
                            ),
                            borderRadius: BorderRadius.all(
                              Radius.circular(80),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: 200.0,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: 10,
                      padding: EdgeInsets.only(left: 20.0, right: 20.0, top: 20.0),
                      itemBuilder: (context, index) {
                        return Container(
                          margin: EdgeInsets.only(right: 20.0),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20.0),
                            color: Colors.black,
                          ),
                          width: 300.0,
                        );
                      },
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 20.0),
                    height: 80.0,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Flexible(
                          child: Container(
                            child: Column(
                              children: <Widget>[
                                IconButton(
                                  icon: Icon(Icons.create), onPressed: () {},
                                ),
                                Text('測試'),
                              ],
                            ),
                            width: 70,
                            height: 70,
                          ),
                          flex: 1,
                        ),
                        Flexible(
                          child: Container(
                            child: Column(
                              children: <Widget>[
                                IconButton(
                                  icon: Icon(Icons.print), onPressed: () {},
                                ),
                                Text('測試'),
                              ],
                            ),
                            width: 70,
                            height: 70,
                          ),
                          flex: 1,
                        ),
                        Flexible(
                          child: Container(
                            child: Column(
                              children: <Widget>[
                                IconButton(
                                  icon: Icon(Icons.photo), onPressed: () {},
                                ),
                                Text('測試'),
                              ],
                            ),
                            width: 70,
                            height: 70,
                          ),
                          flex: 1,
                        ),
                        Flexible(
                          child: Container(
                            child: Column(
                              children: <Widget>[
                                IconButton(
                                  icon: Icon(Icons.camera), onPressed: () {},
                                ),
                                Text('測試'),
                              ],
                            ),
                            width: 70,
                            height: 70,
                          ),
                          flex: 1,
                        ),
                        Flexible(
                          child: Container(
                            child: Column(
                              children: <Widget>[
                                IconButton(
                                  icon: Icon(Icons.add), onPressed: () {},
                                ),
                                Text('測試'),
                              ],
                            ),
                            width: 70,
                            height: 70,
                          ),
                          flex: 1,
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: ListView.builder(
                      itemCount: 100,
                      itemBuilder: (context, index) {
                        return Container(
                          margin: EdgeInsets.symmetric(vertical: 5.0),
                          height: 100.0,
                          color: Colors.black38,
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
