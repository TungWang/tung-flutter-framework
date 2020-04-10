import 'package:flutter/material.dart';
import 'package:tungflutterframework/screens/camera_screen.dart';
import 'package:tungflutterframework/screens/phone_call_screen.dart';
import 'package:tungflutterframework/screens/web_screen.dart';
import 'network_screen.dart';
import 'share_screen.dart';
import 'tappay_screen.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() {
  runApp(EasyLocalization(
    child: MyApp(),
    supportedLocales: [Locale('en', 'US'), Locale('zh', 'TW')],
    path: 'resources/langs',
  ));
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int _currentIndex = 0;

  final tabs = [
    NetworkScreen(),
    ShareScreen(),
    TappayScreen(),
    WebScreen(),
    PhoneCallScreen(),
    CameraScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        EasyLocalization.of(context).delegate,
      ],
      color: Colors.white,
      home: Scaffold(
        body: tabs[_currentIndex],
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.shifting,
          currentIndex: _currentIndex,
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.network_check),
              title: Text('network'.tr()),
              backgroundColor: Colors.blueAccent,
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.share),
              title: Text('share'.tr()),
              backgroundColor: Colors.greenAccent,
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.monetization_on),
              title: Text('payment'.tr()),
              backgroundColor: Colors.redAccent,
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.web),
              title: Text('web'.tr()),
              backgroundColor: Colors.deepPurpleAccent,
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
