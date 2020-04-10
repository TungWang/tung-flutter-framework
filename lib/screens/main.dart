import 'package:flutter/material.dart';
import 'package:tungflutterframework/screens/phone_call_screen.dart';
import 'package:tungflutterframework/screens/web_screen.dart';
import 'network_screen.dart';
import 'share_screen.dart';
import 'tappay_screen.dart';

void main() => runApp(MyApp());

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
              icon: Icon(Icons.network_check),
              title: Text('Network'),
              backgroundColor: Colors.blueAccent,
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.share),
              title: Text('Share'),
              backgroundColor: Colors.greenAccent,
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.monetization_on),
              title: Text('Tappay'),
              backgroundColor: Colors.redAccent,
            ),BottomNavigationBarItem(
              icon: Icon(Icons.web),
              title: Text('Web'),
              backgroundColor: Colors.deepPurpleAccent,
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.phone),
              title: Text('Phone call'),
              backgroundColor: Colors.orangeAccent,
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
