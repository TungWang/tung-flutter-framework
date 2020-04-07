import 'error_model.dart';
import 'user_element_model.dart';
import 'user_model.dart';

class LoginModel {
  final bool result;
  final UserElementModel user;
  final List<ErrorModel> errors;

  LoginModel({this.result, this.user, this.errors});

  factory LoginModel.fromJson(Map<String, dynamic> json) {

    UserElementModel user;
    List<ErrorModel> errors = [];

    try {
      user = UserElementModel.fromJson(json['user']);
    }catch (e) {
      user = UserElementModel(user: UserModel(name: ''), groups: []);
    }

    try {
      final jsonErrors = List<Map<String,dynamic>>.from(json['errors']);
      for (var jsonError in jsonErrors) {
        ErrorModel error = ErrorModel.fromJson(jsonError);
        errors.add(error);
      }
    }catch (e) {
      errors = [ErrorModel(errorCode: '', errorMessage: '')];
      print(e);
    }

    return LoginModel(
      result: json['result'],
      user: user,
      errors: errors,
    );
  }
}

