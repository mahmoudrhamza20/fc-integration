// To parse this JSON data, do
//
//     final ternsModel = ternsModelFromJson(jsonString);

import 'dart:convert';

TermsModel ternsModelFromJson(String str) =>
    TermsModel.fromJson(json.decode(str));

String ternsModelToJson(TermsModel data) => json.encode(data.toJson());

class TermsModel {
  bool result;
  String message;
  int status;
  TermsData data;

  TermsModel({
    required this.result,
    required this.message,
    required this.status,
    required this.data,
  });

  factory TermsModel.fromJson(Map<String, dynamic> json) => TermsModel(
        result: json["result"],
        message: json["message"],
        status: json["status"],
        data: TermsData.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "result": result,
        "message": message,
        "status": status,
        "data": data.toJson(),
      };
}

class TermsData {
  String terms;

  TermsData({
    required this.terms,
  });

  factory TermsData.fromJson(Map<String, dynamic> json) => TermsData(
        terms: json["terms"],
      );

  Map<String, dynamic> toJson() => {
        "terms": terms,
      };
}
