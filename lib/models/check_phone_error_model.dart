// To parse this JSON data, do
//
//     final checkPhoneErrorModel = checkPhoneErrorModelFromJson(jsonString);

import 'dart:convert';

CheckPhoneErrorModel checkPhoneErrorModelFromJson(String str) =>
    CheckPhoneErrorModel.fromJson(json.decode(str));

String checkPhoneErrorModelToJson(CheckPhoneErrorModel data) =>
    json.encode(data.toJson());

class CheckPhoneErrorModel {
  bool status;
  String message;
  // List<Error> errors;
  List<Map<String, String>> errors;

  CheckPhoneErrorModel({
    required this.status,
    required this.message,
    required this.errors,
  });

  factory CheckPhoneErrorModel.fromJson(Map<String, dynamic> json) =>
      CheckPhoneErrorModel(
          status: json["status"],
          message: json["message"],
          errors: List<Map<String, String>>.from(
              json['errors'].map((e) => Map<String, String>.from(e)))
          // errors: List<Error>.from(json["errors"].map((x) => Error.fromJson(x))),
          );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        // "errors": List<dynamic>.from(errors.map((x) => x.toJson())),
      };
}

class Error {
  String phone;
  String countryCode;

  Error({
    required this.phone,
    required this.countryCode,
  });

  factory Error.fromJson(Map<String, dynamic> json) => Error(
        phone: json["phone"],
        countryCode: json["country_code"],
      );

  Map<String, dynamic> toJson() => {
        "phone": phone,
        "country_code": countryCode,
      };
}
