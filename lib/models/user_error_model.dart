// To parse this JSON data, do
//
//     final userModeError = userModeErrorFromJson(jsonString);

import 'dart:convert';

UserModeError userModeErrorFromJson(String str) =>
    UserModeError.fromJson(json.decode(str));

String userModeErrorToJson(UserModeError data) => json.encode(data.toJson());

class UserModeError {
  bool status;
  String message;
  // List<Error> errors;
  List<Map<String, String>> errors;

  UserModeError({
    required this.status,
    required this.message,
    required this.errors,
  });

  factory UserModeError.fromJson(Map<String, dynamic> json) => UserModeError(
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
  String? name;
  String? phone;
  String? password;
  String? confirmPassword;
  String? dob;
  String? gender;
  String? country;
  String? address;
  String? deviceToken;

  Error({
    this.name,
    this.phone,
    this.password,
    this.confirmPassword,
    this.dob,
    this.gender,
    this.country,
    this.address,
    this.deviceToken,
  });

  factory Error.fromJson(Map<String, dynamic> json) => Error(
        name: json["name"],
        phone: json["phone"],
        password: json["password"],
        confirmPassword: json["confirm_password"],
        dob: json["dob"],
        gender: json["gender"],
        country: json["country"],
        address: json["address"],
        deviceToken: json["device_token"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "phone": phone,
        "password": password,
        "confirm_password": confirmPassword,
        "dob": dob,
        "gender": gender,
        "country": country,
        "address": address,
        "device_token": deviceToken,
      };
}
