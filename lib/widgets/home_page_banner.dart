import 'dart:typed_data';

import 'package:flutter/material.dart';

class HomePageBanner extends StatelessWidget {
  final Uint8List imageData;
  final double height;

  HomePageBanner({this.height, this.imageData});

  @override
  Widget build(BuildContext context) {
    if (imageData == null) {
      return Center(
        child: CircularProgressIndicator(),
      );
    }

    return Stack(
      children: <Widget>[
        Container(
          height: height,
          decoration: BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.fill,
              image: MemoryImage(imageData),
            ),
            color: Theme.of(context).primaryColor,
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(40.0),
            ),
          ),
        ),
        Container(
          height: height,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(40.0),
            ),
            gradient: LinearGradient(
              begin: AlignmentDirectional.topCenter,
              end: AlignmentDirectional.bottomCenter,
              colors: [Theme.of(context).primaryColor, Colors.transparent],
            ),
          ),
        ),
      ],
    );
  }
}
