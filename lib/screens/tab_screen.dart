import 'package:flutter/material.dart';
import 'package:tungflutterframework/screens/camera_screen.dart';
import 'package:tungflutterframework/screens/phone_call_screen.dart';
import 'share_screen.dart';
import 'tappay_screen.dart';
import 'package:easy_localization/easy_localization.dart';

class TabScreen extends StatefulWidget {
  @override
  _TabScreenState createState() => _TabScreenState();
}

class _TabScreenState extends State<TabScreen> {

  int _currentIndex = 0;

  final tabs = [
    ShareScreen(),
    TappayScreen(),
    PhoneCallScreen(),
    CameraScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      color: Colors.white,
      home: Scaffold(
        body: tabs[_currentIndex],
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.shifting,
          currentIndex: _currentIndex,
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.share),
              title: Text('share'.tr()),
              backgroundColor: Colors.greenAccent,
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.monetization_on),
              title: Text('payment'),
              backgroundColor: Colors.redAccent,
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.phone),
              title: Text('phoneCall'.tr()),
              backgroundColor: Colors.orangeAccent,
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.camera),
              title: Text('camera'.tr()),
              backgroundColor: Colors.tealAccent,
            ),
          ],
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
        ),
      ),
    );
  }
}
