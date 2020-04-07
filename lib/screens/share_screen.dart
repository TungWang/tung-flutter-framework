import 'package:flutter/material.dart';
import 'package:share/share.dart';
import 'package:tungflutterframework/widgets/rounded_button.dart';

class ShareScreen extends StatefulWidget {
  @override
  _ShareScreenState createState() => _ShareScreenState();
}

class _ShareScreenState extends State<ShareScreen> {
  final textController = TextEditingController();
  String text = '';

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (!FocusScope.of(context).hasPrimaryFocus) {
          FocusScope.of(context).unfocus();
        }
      },
      child: MaterialApp(
        color: Colors.white,
        home: Scaffold(
          resizeToAvoidBottomPadding: false,
          appBar: AppBar(
            backgroundColor: Colors.greenAccent,
            title: Text('Share'),
          ),
          body: Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.0),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Theme(
                    data: ThemeData(
                      primaryColor: Colors.greenAccent,
                    ),
                    child: TextField(
                      controller: textController,
                      decoration: InputDecoration(
                        labelText: 'Share text:',
                        hintText: 'Enter some text and/or link to share',
                      ),
                      maxLines: 1,
                      onChanged: (String value) => setState(() {
                        text = value;
                      }),
                    ),
                  ),
                  RoundedButton(
                    color: Colors.greenAccent,
                    title: 'Share',
                    onPressed: text.isEmpty
                        ? null
                        : () {
                            textController.clear();
                            Share.share(text);
                          },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
