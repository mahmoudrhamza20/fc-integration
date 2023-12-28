// To parse this JSON data, do
//
//     final checkPhoneToResetPassErrorModel = checkPhoneToResetPassErrorModelFromJson(jsonString);

import 'dart:convert';

CheckPhoneToResetPassErrorModel2 checkPhoneToResetPassErrorModelFromJson(
        String str) =>
    CheckPhoneToResetPassErrorModel2.fromJson(json.decode(str));

String checkPhoneToResetPassErrorModelToJson(
        CheckPhoneToResetPassErrorModel2 data) =>
    json.encode(data.toJson());

class CheckPhoneToResetPassErrorModel2 {
  String message;
  Errors errors;

  CheckPhoneToResetPassErrorModel2({
    required this.message,
    required this.errors,
  });

  factory CheckPhoneToResetPassErrorModel2.fromJson(
          Map<String, dynamic> json) =>
      CheckPhoneToResetPassErrorModel2(
        message: json["message"],
        errors: Errors.fromJson(json["errors"]),
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "errors": errors.toJson(),
      };
}

class Errors {
  List<String> phone;

  Errors({
    required this.phone,
  });

  factory Errors.fromJson(Map<String, dynamic> json) => Errors(
        phone: List<String>.from(json["phone"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "phone": List<dynamic>.from(phone.map((x) => x)),
      };
}
