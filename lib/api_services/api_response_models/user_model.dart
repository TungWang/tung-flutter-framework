import 'theme_model.dart';

class UserModel {
  final String name;
  final String email;
  final ThemeModel theme;

  UserModel({this.name, this.email, this.theme});

  factory UserModel.fromJson(Map<String, dynamic> json) {

    final theme = ThemeModel.fromJson(json['theme']);

    return UserModel(
      name: json['name'],
      email: json['email'],
      theme: theme,
    );
  }
}

