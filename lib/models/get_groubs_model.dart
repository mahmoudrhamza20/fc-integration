// To parse this JSON data, do
//
//     final getGroupsModel = getGroupsModelFromJson(jsonString);

import 'dart:convert';

GetGroupsModel getGroupsModelFromJson(String str) =>
    GetGroupsModel.fromJson(json.decode(str));

String getGroupsModelToJson(GetGroupsModel data) => json.encode(data.toJson());

class GetGroupsModel {
  bool result;
  String message;
  int status;
  GroupData data;

  GetGroupsModel({
    required this.result,
    required this.message,
    required this.status,
    required this.data,
  });

  factory GetGroupsModel.fromJson(Map<String, dynamic> json) => GetGroupsModel(
        result: json["result"],
        message: json["message"],
        status: json["status"],
        data: GroupData.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "result": result,
        "message": message,
        "status": status,
        "data": data.toJson(),
      };
}

class GroupData {
  List<Group> groups;

  GroupData({
    required this.groups,
  });

  factory GroupData.fromJson(Map<String, dynamic> json) => GroupData(
        groups: List<Group>.from(json["groups"].map((x) => Group.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "groups": List<dynamic>.from(groups.map((x) => x.toJson())),
      };
}

class Group {
  int id;
  int groupNumber;
  String name;
  String stage;
  User user;

  Group({
    required this.id,
    required this.groupNumber,
    required this.name,
    required this.stage,
    required this.user,
  });

  factory Group.fromJson(Map<String, dynamic> json) => Group(
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
