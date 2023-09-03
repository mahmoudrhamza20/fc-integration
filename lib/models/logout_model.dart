// To parse this JSON data, do
//
//     final logoutModel = logoutModelFromJson(jsonString);

import 'dart:convert';

LogoutModel logoutModelFromJson(String str) =>
    LogoutModel.fromJson(json.decode(str));

String logoutModelToJson(LogoutModel data) => json.encode(data.toJson());

class LogoutModel {
  bool result;
  String message;
  int status;
  List<dynamic> data;

  LogoutModel({
    required this.result,
    required this.message,
    required this.status,
    required this.data,
  });

  factory LogoutModel.fromJson(Map<String, dynamic> json) => LogoutModel(
        result: json["result"],
        message: json["message"],
        status: json["status"],
        data: List<dynamic>.from(json["data"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "result": result,
        "message": message,
        "status": status,
        "data": List<dynamic>.from(data.map((x) => x)),
      };
}
