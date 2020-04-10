import 'package:flutter/material.dart';
import 'package:tungflutterframework/services/api_services/api_response_models/login_model.dart';
import 'package:tungflutterframework/constans.dart';

Widget getNetworkDemo(Future<LoginModel> futureLogin) {
  return FutureBuilder<LoginModel>(
    future: futureLogin,
    builder: (context, snapshot) {
      if (snapshot.hasData) {
        if (snapshot.data.result == true) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              CircleAvatar(
                backgroundImage: NetworkImage(
                    '$kViainnoUrl/File/Download?fileGuid=%2B1_2_${snapshot.data.user.user.theme.avatar}'),
                radius: 80.0,
              ),
              SizedBox(
                height: 30.0,
              ),
              Text(
                snapshot.data.user.user.name,
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 30.0,
                    fontWeight: FontWeight.w700
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              Text(
                snapshot.data.user.user.email,
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 30.0,
                    fontWeight: FontWeight.w700
                ),
              ),
            ],
          );
        } else {
          return Text(snapshot.data.errors[0].errorMessage);
        }
      } else if (snapshot.hasError) {
        return Text("${snapshot.error}");
      }

      // By default, show a loading spinner.
      return CircularProgressIndicator();
    },
  );
}