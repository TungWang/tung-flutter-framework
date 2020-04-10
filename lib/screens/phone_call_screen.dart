import 'package:flutter/material.dart';
import 'package:tungflutterframework/services/launch_service.dart';

class PhoneCallScreen extends StatelessWidget {

  final LaunchHelper _launchHelper = LaunchHelper();
  final String _phone = '0928825720';
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.orangeAccent,
          title: Text('Phone call'),
        ),
        body: Center(
          child: Text('Phone call screen'),
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.phone),
          backgroundColor: Colors.orangeAccent,
          onPressed: () {
            _launchHelper.makePhoneCall('tel:$_phone');
          },
        ),
      ),
    );
  }
}
