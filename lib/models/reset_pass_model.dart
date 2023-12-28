// To parse this JSON data, do
//
//     final resetPassModel = resetPassModelFromJson(jsonString);

import 'dart:convert';

ResetPassModel resetPassModelFromJson(String str) =>
    ResetPassModel.fromJson(json.decode(str));

String resetPassModelToJson(ResetPassModel data) => json.encode(data.toJson());

class ResetPassModel {
  bool result;
  String message;
  int status;
  Data data;

  ResetPassModel({
    required this.result,
    required this.message,
    required this.status,
    required this.data,
  });

  factory ResetPassModel.fromJson(Map<String, dynamic> json) => ResetPassModel(
        result: json["result"],
        message: json["message"],
        status: json["status"],
        data: Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "result": result,
        "message": message,
        "status": status,
        "data": data.toJson(),
      };
}

class Data {
  User user;
  dynamic token;

  Data({
    required this.user,
    required this.token,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        user: User.fromJson(json["user"]),
        token: json["token"],
      );

  Map<String, dynamic> toJson() => {
        "user": user.toJson(),
        "token": token,
      };
}

class User {
  dynamic id;
  dynamic name;
  dynamic phone;
  dynamic countryCode;
  dynamic country;
  dynamic dob;
  dynamic image;
  dynamic blocked;
  dynamic language;

  User({
    required this.id,
    required this.name,
    required this.phone,
    required this.countryCode,
    required this.country,
    required this.dob,
    required this.image,
    required this.blocked,
    required this.language,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        name: json["name"],
        phone: json["phone"],
        countryCode: json["country_code"],
        country: json["country"],
        dob: DateTime.parse(json["dob"]),
        image: json["image"],
        blocked: json["blocked"],
        language: json["language"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "phone": phone,
        "country_code": countryCode,
        "country": country,
        "dob":
            "${dob.year.toString().padLeft(4, '0')}-${dob.month.toString().padLeft(2, '0')}-${dob.day.toString().padLeft(2, '0')}",
        "image": image,
        "blocked": blocked,
        "language": language,
      };
}
