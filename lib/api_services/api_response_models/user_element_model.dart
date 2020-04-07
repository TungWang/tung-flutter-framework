import 'user_model.dart';

class UserElementModel {
  final UserModel user;
  final List<String> groups;

  UserElementModel({this.user, this.groups});

  factory UserElementModel.fromJson(Map<String, dynamic> json) {

    final UserModel user = UserModel.fromJson(json['user']);
    final List<String> groups = List<String>.from(json['groups']);

    return UserElementModel(
      user: user,
      groups: groups,
    );
  }
}

