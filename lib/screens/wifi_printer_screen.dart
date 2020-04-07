import 'package:flutter/material.dart';

class WifiPrinterScreen extends StatefulWidget {
  @override
  _WifiPrinterScreenState createState() => _WifiPrinterScreenState();
}

class _WifiPrinterScreenState extends State<WifiPrinterScreen> {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      color: Colors.white,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.greenAccent,
          title: Text('Wifi printer'),
        ),
        body: Container(
          child: Center(
            child: Text('Wifi printer screen'),
          ),
        ),
      ),
    );
  }
}
