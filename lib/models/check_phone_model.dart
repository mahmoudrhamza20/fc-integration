// To parse this JSON data, do
//
//     final checkPhoneModel = checkPhoneModelFromJson(jsonString);

import 'dart:convert';

CheckPhoneModel checkPhoneModelFromJson(String str) =>
    CheckPhoneModel.fromJson(json.decode(str));

String checkPhoneModelToJson(CheckPhoneModel data) =>
    json.encode(data.toJson());

class CheckPhoneModel {
  bool result;
  String message;
  int status;
  List<CheckPhoneData> data;

  CheckPhoneModel({
    required this.result,
    required this.message,
    required this.status,
    required this.data,
  });

  factory CheckPhoneModel.fromJson(Map<String, dynamic> json) =>
      CheckPhoneModel(
        result: json["result"],
        message: json["message"],
        status: json["status"],
        data: List<CheckPhoneData>.from(
            json["data"].map((x) => CheckPhoneData.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "result": result,
        "message": message,
        "status": status,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class CheckPhoneData {
  String phone;

  CheckPhoneData({
    required this.phone,
  });

  factory CheckPhoneData.fromJson(Map<String, dynamic> json) => CheckPhoneData(
        phone: json["phone"],
      );

  Map<String, dynamic> toJson() => {
        "phone": phone,
      };
}
