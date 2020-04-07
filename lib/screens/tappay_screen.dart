import 'package:flutter/material.dart';

class TappayScreen extends StatefulWidget {
  @override
  _TappayScreenState createState() => _TappayScreenState();
}

class _TappayScreenState extends State<TappayScreen> {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      color: Colors.white,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.redAccent,
          title: Text('Tappay'),
        ),
        body: Container(
          child: Center(
            child: Text('Tappay screen'),
          ),
        ),
      ),
    );
  }
}
