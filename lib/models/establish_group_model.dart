// To parse this JSON data, do
//
//     final establishGroupModel = establishGroupModelFromJson(jsonString);

import 'dart:convert';

EstablishGroupModel establishGroupModelFromJson(String str) =>
    EstablishGroupModel.fromJson(json.decode(str));

String establishGroupModelToJson(EstablishGroupModel data) =>
    json.encode(data.toJson());

class EstablishGroupModel {
  bool result;
  String message;
  int status;
  List<dynamic> data;

  EstablishGroupModel({
    required this.result,
    required this.message,
    required this.status,
    required this.data,
  });

  factory EstablishGroupModel.fromJson(Map<String, dynamic> json) =>
      EstablishGroupModel(
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
