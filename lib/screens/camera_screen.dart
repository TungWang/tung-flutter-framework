import 'package:flutter/material.dart';
import 'package:barcode_scan/barcode_scan.dart';

class CameraScreen extends StatefulWidget {
  @override
  _CameraScreenState createState() => _CameraScreenState();
}

class _CameraScreenState extends State<CameraScreen> {

  String _barcode = "Your barcode result.";

  Future scan() async {
    try {
      String barcode = await BarcodeScanner.scan();
      setState(() {
        _barcode = barcode;
      });
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.orangeAccent,
          title: Text('Camera'),
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.0),
          child: Center(
            child: Text(_barcode),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.camera),
          backgroundColor: Colors.orangeAccent,
          onPressed: () {
            scan();
          },
        ),
      ),
    );
  }
}
