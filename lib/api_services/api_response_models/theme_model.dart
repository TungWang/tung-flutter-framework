
class ThemeModel {
  final String avatar;

  ThemeModel({this.avatar});

  factory ThemeModel.fromJson(Map<String, dynamic> json) {
    return ThemeModel(
      avatar: json['avatar'],
    );
  }
}