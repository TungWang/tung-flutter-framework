import 'package:flutter/material.dart';
import 'package:tungflutterframework/api_services/api_response_models/login_model.dart';
import 'package:tungflutterframework/api_services/login.dart';
import 'package:tungflutterframework/widgets/network_demo.dart';

class NetworkScreen extends StatefulWidget {
  @override
  _NetworkScreenState createState() => _NetworkScreenState();
}

class _NetworkScreenState extends State<NetworkScreen> {
  Future<LoginModel> login;

  void getLogin() {
    login = Login().login('sparky800321@gmail.com', 'winnie0607', '');
  }

  @override
  void initState() {
    super.initState();
    getLogin();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      color: Colors.white,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blueAccent,
          title: Text('Network'),
        ),
        body: Container(
          child: Center(
            child: getNetworkDemo(login),
          ),
        ),
      ),
    );
  }
}
