// To parse this JSON data, do
//
//     final checkPhoneToResetPassModel = checkPhoneToResetPassModelFromJson(jsonString);

import 'dart:convert';

CheckPhoneToResetPassModel checkPhoneToResetPassModelFromJson(String str) =>
    CheckPhoneToResetPassModel.fromJson(json.decode(str));

String checkPhoneToResetPassModelToJson(CheckPhoneToResetPassModel data) =>
    json.encode(data.toJson());

class CheckPhoneToResetPassModel {
  bool result;
  String message;
  int status;
  List<dynamic> data;

  CheckPhoneToResetPassModel({
    required this.result,
    required this.message,
    required this.status,
    required this.data,
  });

  factory CheckPhoneToResetPassModel.fromJson(Map<String, dynamic> json) =>
      CheckPhoneToResetPassModel(
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
