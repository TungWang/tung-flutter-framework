import 'package:flutter/material.dart';

class TappayTextField extends StatelessWidget {

  TappayTextField({this.labelText, this.hintText, this.onChanged});

  final String labelText;
  final String hintText;
  final Function(String) onChanged;

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(
        primaryColor: Colors.redAccent,
      ),
      child: TextField(
        onChanged: onChanged,
        decoration: InputDecoration(
          labelText: labelText,
          hintText: hintText,
        ),
        maxLines: 1,
      ),
    );
  }
}
