// To parse this JSON data, do
//
//     final searchErrorModel = searchErrorModelFromJson(jsonString);

import 'dart:convert';

SearchErrorModel searchErrorModelFromJson(String str) =>
    SearchErrorModel.fromJson(json.decode(str));

String searchErrorModelToJson(SearchErrorModel data) =>
    json.encode(data.toJson());

class SearchErrorModel {
  String message;
  Errors errors;

  SearchErrorModel({
    required this.message,
    required this.errors,
  });

  factory SearchErrorModel.fromJson(Map<String, dynamic> json) =>
      SearchErrorModel(
        message: json["message"],
        errors: Errors.fromJson(json["errors"]),
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "errors": errors.toJson(),
      };
}

class Errors {
  List<String> groupNumber;

  Errors({
    required this.groupNumber,
  });

  factory Errors.fromJson(Map<String, dynamic> json) => Errors(
        groupNumber: List<String>.from(json["group_number"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "group_number": List<dynamic>.from(groupNumber.map((x) => x)),
      };
}
