
class ErrorModel {
  final String errorCode;
  final String errorMessage;

  ErrorModel({this.errorCode, this.errorMessage});

  factory ErrorModel.fromJson(Map<String, dynamic> json) {

    return ErrorModel(
      errorCode: json['errorCode'],
      errorMessage: json['errorMessage'],
    );
  }
}