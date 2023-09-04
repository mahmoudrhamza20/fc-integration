// To parse this JSON data, do
//
//     final logoutErrorModel = logoutErrorModelFromJson(jsonString);

import 'dart:convert';

LogoutErrorModel logoutErrorModelFromJson(String str) =>
    LogoutErrorModel.fromJson(json.decode(str));

String logoutErrorModelToJson(LogoutErrorModel data) =>
    json.encode(data.toJson());

class LogoutErrorModel {
  String message;

  LogoutErrorModel({
    required this.message,
  });

  factory LogoutErrorModel.fromJson(Map<String, dynamic> json) =>
      LogoutErrorModel(
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "message": message,
      };
}
