// To parse this JSON data, do
//
//     final userModel = userModelFromJson(jsonString);

import 'dart:convert';

UserModel userModelFromJson(String str) => UserModel.fromJson(json.decode(str));

String userModelToJson(UserModel data) => json.encode(data.toJson());

class UserModel {
  dynamic result;
  String message;
  int status;
  Data data;

  UserModel({
    required this.result,
    required this.message,
    required this.status,
    required this.data,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
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
  UserData user;
  dynamic token;

  Data({
    required this.user,
    required this.token,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        user: UserData.fromJson(json["user"]),
        token: json["token"],
      );

  Map<String, dynamic> toJson() => {
        "user": user.toJson(),
        "token": token,
      };
}

class UserData {
  int id;
  dynamic name;
  dynamic country;
  dynamic phone;
  DateTime dob;
  dynamic address;
  dynamic region;
  dynamic image;
  dynamic group;
  dynamic stage;
  dynamic blocked;
  dynamic language;
  DateTime createdAt;

  UserData({
    required this.id,
    required this.name,
    required this.country,
    required this.phone,
    required this.dob,
    required this.address,
    required this.region,
    required this.image,
    required this.group,
    required this.stage,
    required this.blocked,
    required this.language,
    required this.createdAt,
  });

  factory UserData.fromJson(Map<String, dynamic> json) => UserData(
        id: json["id"],
        name: json["name"],
        country: json["country"],
        phone: json["phone"],
        dob: DateTime.parse(json["dob"]),
        address: json["address"],
        region: json["region"],
        image: json["image"],
        group: json["group"],
        stage: json["stage"],
        blocked: json["blocked"],
        language: json["language"],
        createdAt: DateTime.parse(json["created_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "country": country,
        "phone": phone,
        "dob":
            "${dob.year.toString().padLeft(4, '0')}-${dob.month.toString().padLeft(2, '0')}-${dob.day.toString().padLeft(2, '0')}",
        "address": address,
        "region": region,
        "image": image,
        "group": group,
        "stage": stage,
        "blocked": blocked,
        "language": language,
        "created_at":
            "${createdAt.year.toString().padLeft(4, '0')}-${createdAt.month.toString().padLeft(2, '0')}-${createdAt.day.toString().padLeft(2, '0')}",
      };
}
