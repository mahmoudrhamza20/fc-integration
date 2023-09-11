// To parse this JSON data, do
//
//     final getGroupsByIdModel = getGroupsByIdModelFromJson(jsonString);

import 'dart:convert';

GetGroupsByIdModel getGroupsByIdModelFromJson(String str) =>
    GetGroupsByIdModel.fromJson(json.decode(str));

String getGroupsByIdModelToJson(GetGroupsByIdModel data) =>
    json.encode(data.toJson());

class GetGroupsByIdModel {
  bool result;
  String message;
  int status;
  GetGroupsByIdData data;

  GetGroupsByIdModel({
    required this.result,
    required this.message,
    required this.status,
    required this.data,
  });

  factory GetGroupsByIdModel.fromJson(Map<String, dynamic> json) =>
      GetGroupsByIdModel(
        result: json["result"],
        message: json["message"],
        status: json["status"],
        data: GetGroupsByIdData.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "result": result,
        "message": message,
        "status": status,
        "data": data.toJson(),
      };
}

class GetGroupsByIdData {
  GroupById group;

  GetGroupsByIdData({
    required this.group,
  });

  factory GetGroupsByIdData.fromJson(Map<String, dynamic> json) =>
      GetGroupsByIdData(
        group: GroupById.fromJson(json["group"]),
      );

  Map<String, dynamic> toJson() => {
        "group": group.toJson(),
      };
}

class GroupById {
  int id;
  int groupNumber;
  String name;
  String stage;
  User user;

  GroupById({
    required this.id,
    required this.groupNumber,
    required this.name,
    required this.stage,
    required this.user,
  });

  factory GroupById.fromJson(Map<String, dynamic> json) => GroupById(
        id: json["id"],
        groupNumber: json["group_number"],
        name: json["name"],
        stage: json["stage"],
        user: User.fromJson(json["user"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "group_number": groupNumber,
        "name": name,
        "stage": stage,
        "user": user.toJson(),
      };
}

class User {
  int id;
  String name;
  String phone;

  User({
    required this.id,
    required this.name,
    required this.phone,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        name: json["name"],
        phone: json["phone"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "phone": phone,
      };
}
