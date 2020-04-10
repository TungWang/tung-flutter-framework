import 'package:flutter/material.dart';
//import 'package:tappayflutter/tappayflutter.dart';
import 'package:tappayflutterplugin/tappayflutterplugin.dart';
import 'package:tungflutterframework/widgets/rounded_button.dart';
import 'package:tungflutterframework/widgets/tappay_textfield.dart';

class TappayScreen extends StatefulWidget {
  @override
  _TappayScreenState createState() => _TappayScreenState();
}

class _TappayScreenState extends State<TappayScreen> {
  String cardNumber;
  String dueMonth;
  String dueYear;
  String ccv;
  String prime = 'Your prime';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        resizeToAvoidBottomPadding: false,
        appBar: AppBar(
          backgroundColor: Colors.redAccent,
          title: Text('Tappay'),
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                TappayTextField(
                  labelText: 'Card number:',
                  hintText: 'Enter your card number',
                  onChanged: (value) {
                    cardNumber = value;
                  },
                ),
                TappayTextField(
                  labelText: 'Due month:',
                  hintText: 'Enter your card due month',
                  onChanged: (value) {
                    dueMonth = value;
                  },
                ),
                TappayTextField(
                  labelText: 'Due year:',
                  hintText: 'Enter your card due year',
                  onChanged: (value) {
                    dueYear = value;
                  },
                ),
                TappayTextField(
                  labelText: 'CCV:',
                  hintText: 'Enter your card ccv',
                  onChanged: (value) {
                    ccv = value;
                  },
                ),
                RoundedButton(
                  color: Colors.redAccent,
                  title: 'Pay',
                  onPressed: () async {
                    String tappayPrime = await Tappayflutterplugin.setupTappay(11884, 'app_TvsahPGQDNK4k9YD3Vwrl7bEgpr4lDQXqm6AOusFKHS4eUvylQ8soAXSdjX8', 'sandBox', cardNumber, dueMonth, dueYear, ccv);
                    setState(() {
                      prime = tappayPrime;
                    });
                  },
                ),
                Text(prime),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
