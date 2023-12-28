// To parse this JSON data, do
//
//     final checkOtpErrorModel2 = checkOtpErrorModel2FromJson(jsonString);

import 'dart:convert';

CheckOtpErrorModel2 checkOtpErrorModel2FromJson(String str) =>
    CheckOtpErrorModel2.fromJson(json.decode(str));

String checkOtpErrorModel2ToJson(CheckOtpErrorModel2 data) =>
    json.encode(data.toJson());

class CheckOtpErrorModel2 {
  String message;
  Errors errors;

  CheckOtpErrorModel2({
    required this.message,
    required this.errors,
  });

  factory CheckOtpErrorModel2.fromJson(Map<String, dynamic> json) =>
      CheckOtpErrorModel2(
        message: json["message"],
        errors: Errors.fromJson(json["errors"]),
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "errors": errors.toJson(),
      };
}

class Errors {
  List<String> countryCode;

  Errors({
    required this.countryCode,
  });

  factory Errors.fromJson(Map<String, dynamic> json) => Errors(
        countryCode: List<String>.from(json["country_code"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "country_code": List<dynamic>.from(countryCode.map((x) => x)),
      };
}
