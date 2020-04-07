import 'package:tungflutterframework/api_services/api_response_models/login_model.dart';
import 'networking.dart';
import 'package:tungflutterframework/constans.dart';

class Login {

  Future<LoginModel> login(String email, String password, String fcm) async {
    final String body = '{"email":"$email", "password":"$password", "fcm":"$fcm"}' ;
    final url = '$kViainnoUrl/user/Login';
    final response = await NetworkHelper(url: url).post(body);
    return LoginModel.fromJson(response);
  }

}