// To parse this JSON data, do
//
//     final joinGroupErrorModel = joinGroupErrorModelFromJson(jsonString);

import 'dart:convert';

JoinGroupErrorModel joinGroupErrorModelFromJson(String str) =>
    JoinGroupErrorModel.fromJson(json.decode(str));

String joinGroupErrorModelToJson(JoinGroupErrorModel data) =>
    json.encode(data.toJson());

class JoinGroupErrorModel {
  bool result;
  String message;
  int status;

  JoinGroupErrorModel({
    required this.result,
    required this.message,
    required this.status,
  });

  factory JoinGroupErrorModel.fromJson(Map<String, dynamic> json) =>
      JoinGroupErrorModel(
        result: json["result"],
        message: json["message"],
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "result": result,
        "message": message,
        "status": status,
      };
}
