// To parse this JSON data, do
//
//     final checkOtbModel = checkOtbModelFromJson(jsonString);

import 'dart:convert';

CheckOtbModel checkOtbModelFromJson(String str) =>
    CheckOtbModel.fromJson(json.decode(str));

String checkOtbModelToJson(CheckOtbModel data) => json.encode(data.toJson());

class CheckOtbModel {
  bool result;
  String message;
  int status;
  CheckOtbData data;

  CheckOtbModel({
    required this.result,
    required this.message,
    required this.status,
    required this.data,
  });

  factory CheckOtbModel.fromJson(Map<String, dynamic> json) => CheckOtbModel(
        result: json["result"],
        message: json["message"],
        status: json["status"],
        data: CheckOtbData.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "result": result,
        "message": message,
        "status": status,
        "data": data.toJson(),
      };
}

class CheckOtbData {
  String phone;

  CheckOtbData({
    required this.phone,
  });

  factory CheckOtbData.fromJson(Map<String, dynamic> json) => CheckOtbData(
        phone: json["phone"],
      );

  Map<String, dynamic> toJson() => {
        "phone": phone,
      };
}
