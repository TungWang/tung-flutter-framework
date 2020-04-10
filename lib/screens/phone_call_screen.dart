import 'package:flutter/material.dart';
import 'package:tungflutterframework/services/launch_service.dart';
import 'package:easy_localization/easy_localization.dart';

class PhoneCallScreen extends StatelessWidget {

  final LaunchHelper _launchHelper = LaunchHelper();
  final String _phone = '0928825720';
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.orangeAccent,
          title: Text('phoneCall'.tr()),
        ),
        body: Center(
          child: Text('phoneCall'.tr()),
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
