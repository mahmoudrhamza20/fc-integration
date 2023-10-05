// // To parse this JSON data, do
// //
// //     final checkOtbErrorModel = checkOtbErrorModelFromJson(jsonString);

// import 'dart:convert';

// CheckOtbErrorModel checkOtbErrorModelFromJson(String str) =>
//     CheckOtbErrorModel.fromJson(json.decode(str));

// String checkOtbErrorModelToJson(CheckOtbErrorModel data) =>
//     json.encode(data.toJson());

// class CheckOtbErrorModel {
//   bool status;
//   String message;
//   List<Error> errors;

//   CheckOtbErrorModel({
//     required this.status,
//     required this.message,
//     required this.errors,
//   });

//   factory CheckOtbErrorModel.fromJson(Map<String, dynamic> json) =>
//       CheckOtbErrorModel(
//         status: json["status"],
//         message: json["message"],
//         errors: List<Error>.from(json["errors"].map((x) => Error.fromJson(x))),
//       );

//   Map<String, dynamic> toJson() => {
//         "status": status,
//         "message": message,
//         "errors": List<dynamic>.from(errors.map((x) => x.toJson())),
//       };
// }

// class Error {
//   String? phone;
//   String? otp;

//   Error({
//     this.phone,
//     this.otp,
//   });

//   factory Error.fromJson(Map<String, dynamic> json) => Error(
//         phone: json["phone"],
//         otp: json["otp"],
//       );

//   Map<String, dynamic> toJson() => {
//         "phone": phone,
//         "otp": otp,
//       };
// }

// To parse this JSON data, do
//
//     final checkOtbErrorModel = checkOtbErrorModelFromJson(jsonString);

import 'dart:convert';

CheckOtbErrorModel checkOtbErrorModelFromJson(String str) =>
    CheckOtbErrorModel.fromJson(json.decode(str));

String checkOtbErrorModelToJson(CheckOtbErrorModel data) =>
    json.encode(data.toJson());

class CheckOtbErrorModel {
  bool status;
  String message;
  // List<Error> errors;
  List<Map<String, String>> errors;

  CheckOtbErrorModel({
    required this.status,
    required this.message,
    required this.errors,
  });

  factory CheckOtbErrorModel.fromJson(Map<String, dynamic> json) =>
      CheckOtbErrorModel(
          status: json["status"],
          message: json["message"],
          errors: List<Map<String, String>>.from(
              json['errors'].map((e) => Map<String, String>.from(e))));

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        // "errors": List<dynamic>.from(errors.map((x) => x.toJson())),
      };
}

class Error {
  String? phone;
  String? otp;

  Error({
    this.phone,
    this.otp,
  });

  factory Error.fromJson(Map<String, dynamic> json) => Error(
        phone: json["phone"],
        otp: json["otp"],
      );

  Map<String, dynamic> toJson() => {
        "phone": phone,
        "otp": otp,
      };
}
