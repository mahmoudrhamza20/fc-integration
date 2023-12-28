// To parse this JSON data, do
//
//     final checkPhoneToResetPassErrorModel = checkPhoneToResetPassErrorModelFromJson(jsonString);

import 'dart:convert';

CheckPhoneToResetPassErrorModel checkPhoneToResetPassErrorModelFromJson(
        String str) =>
    CheckPhoneToResetPassErrorModel.fromJson(json.decode(str));

String checkPhoneToResetPassErrorModelToJson(
        CheckPhoneToResetPassErrorModel data) =>
    json.encode(data.toJson());

class CheckPhoneToResetPassErrorModel {
  String message;
  List<Map<String, String>> errors;

  CheckPhoneToResetPassErrorModel({
    required this.message,
    required this.errors,
  });

  factory CheckPhoneToResetPassErrorModel.fromJson(Map<String, dynamic> json) =>
      CheckPhoneToResetPassErrorModel(
          message: json["message"],
          errors: List<Map<String, String>>.from(
              json['errors'].map((e) => Map<String, String>.from(e))));

  Map<String, dynamic> toJson() => {"message": message, "errors": errors};
}

class Errors {
  List<String> phone;
  List<String> countryId;

  Errors({
    required this.phone,
    required this.countryId,
  });

  factory Errors.fromJson(Map<String, dynamic> json) => Errors(
        phone: List<String>.from(json["phone"].map((x) => x)),
        countryId: List<String>.from(json["country_id"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "phone": List<dynamic>.from(phone.map((x) => x)),
        "country_id": List<dynamic>.from(countryId.map((x) => x)),
      };
}
