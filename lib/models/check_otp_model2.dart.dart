// To parse this JSON data, do
//
//     final checkOtpModel = checkOtpModelFromJson(jsonString);

import 'dart:convert';

CheckOtpModel checkOtpModelFromJson(String str) =>
    CheckOtpModel.fromJson(json.decode(str));

String checkOtpModelToJson(CheckOtpModel data) => json.encode(data.toJson());

class CheckOtpModel {
  bool result;
  String message;
  int status;
  List<dynamic> data;

  CheckOtpModel({
    required this.result,
    required this.message,
    required this.status,
    required this.data,
  });

  factory CheckOtpModel.fromJson(Map<String, dynamic> json) => CheckOtpModel(
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
