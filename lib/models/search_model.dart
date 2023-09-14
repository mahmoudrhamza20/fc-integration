// To parse this JSON data, do
//
//     final searchModel = searchModelFromJson(jsonString);

import 'dart:convert';

SearchModel searchModelFromJson(String str) =>
    SearchModel.fromJson(json.decode(str));

String searchModelToJson(SearchModel data) => json.encode(data.toJson());

class SearchModel {
  bool result;
  String message;
  int status;
  SearchData data;

  SearchModel({
    required this.result,
    required this.message,
    required this.status,
    required this.data,
  });

  factory SearchModel.fromJson(Map<String, dynamic> json) => SearchModel(
        result: json["result"],
        message: json["message"],
        status: json["status"],
        data: SearchData.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "result": result,
        "message": message,
        "status": status,
        "data": data.toJson(),
      };
}

class SearchData {
  List<SearchGroup> groups;

  SearchData({
    required this.groups,
  });

  factory SearchData.fromJson(Map<String, dynamic> json) => SearchData(
        groups: List<SearchGroup>.from(
            json["groups"].map((x) => SearchGroup.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "groups": List<dynamic>.from(groups.map((x) => x.toJson())),
      };
}

class SearchGroup {
  int id;
  int groupNumber;
  String name;
  String stage;
  User user;

  SearchGroup({
    required this.id,
    required this.groupNumber,
    required this.name,
    required this.stage,
    required this.user,
  });

  factory SearchGroup.fromJson(Map<String, dynamic> json) => SearchGroup(
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
