// // To parse this JSON data, do
// //
// //     final joinGroupModel = joinGroupModelFromJson(jsonString);

// import 'dart:convert';

// JoinGroupModel joinGroupModelFromJson(String str) =>
//     JoinGroupModel.fromJson(json.decode(str));

// String joinGroupModelToJson(JoinGroupModel data) => json.encode(data.toJson());

// class JoinGroupModel {
//   bool result;
//   String message;
//   int status;
//   JoinGroupData data;

//   JoinGroupModel({
//     required this.result,
//     required this.message,
//     required this.status,
//     required this.data,
//   });

//   factory JoinGroupModel.fromJson(Map<String, dynamic> json) => JoinGroupModel(
//         result: json["result"],
//         message: json["message"],
//         status: json["status"],
//         data: JoinGroupData.fromJson(json["data"]),
//       );

//   Map<String, dynamic> toJson() => {
//         "result": result,
//         "message": message,
//         "status": status,
//         "data": data.toJson(),
//       };
// }

// class JoinGroupData {
//   JoinGroup group;
//   List<String> codes;

//   JoinGroupData({
//     required this.group,
//     required this.codes,
//   });

//   factory JoinGroupData.fromJson(Map<String, dynamic> json) => JoinGroupData(
//         group: JoinGroup.fromJson(json["group"]),
//         codes: List<String>.from(json["codes"].map((x) => x)),
//       );

//   Map<String, dynamic> toJson() => {
//         "group": group.toJson(),
//         "codes": List<dynamic>.from(codes.map((x) => x)),
//       };
// }

// class JoinGroup {
//   int id;
//   int groupNumber;
//   String name;
//   String stage;
//   User user;

//   JoinGroup({
//     required this.id,
//     required this.groupNumber,
//     required this.name,
//     required this.stage,
//     required this.user,
//   });

//   factory JoinGroup.fromJson(Map<String, dynamic> json) => JoinGroup(
//         id: json["id"],
//         groupNumber: json["group_number"],
//         name: json["name"],
//         stage: json["stage"],
//         user: User.fromJson(json["user"]),
//       );

//   Map<String, dynamic> toJson() => {
//         "id": id,
//         "group_number": groupNumber,
//         "name": name,
//         "stage": stage,
//         "user": user.toJson(),
//       };
// }

// class User {
//   int id;
//   String name;
//   String phone;

//   User({
//     required this.id,
//     required this.name,
//     required this.phone,
//   });

//   factory User.fromJson(Map<String, dynamic> json) => User(
//         id: json["id"],
//         name: json["name"],
//         phone: json["phone"],
//       );

//   Map<String, dynamic> toJson() => {
//         "id": id,
//         "name": name,
//         "phone": phone,
//       };
// }

// To parse this JSON data, do
//
//     final joinGroupModel = joinGroupModelFromJson(jsonString);

import 'dart:convert';

JoinGroupModel joinGroupModelFromJson(String str) =>
    JoinGroupModel.fromJson(json.decode(str));

String joinGroupModelToJson(JoinGroupModel data) => json.encode(data.toJson());

class JoinGroupModel {
  bool result;
  String message;
  int status;
  JoinGroupData data;

  JoinGroupModel({
    required this.result,
    required this.message,
    required this.status,
    required this.data,
  });

  factory JoinGroupModel.fromJson(Map<String, dynamic> json) => JoinGroupModel(
        result: json["result"],
        message: json["message"],
        status: json["status"],
        data: JoinGroupData.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "result": result,
        "message": message,
        "status": status,
        "data": data.toJson(),
      };
}

class JoinGroupData {
  JoinGroup group;
  List<String> codes;

  JoinGroupData({
    required this.group,
    required this.codes,
  });

  factory JoinGroupData.fromJson(Map<String, dynamic> json) => JoinGroupData(
        group: JoinGroup.fromJson(json["group"]),
        codes: List<String>.from(json["codes"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "group": group.toJson(),
        "codes": List<dynamic>.from(codes.map((x) => x)),
      };
}

class JoinGroup {
  int id;
  String groupNumber;
  String name;
  String stage;
  Founder founder;

  JoinGroup({
    required this.id,
    required this.groupNumber,
    required this.name,
    required this.stage,
    required this.founder,
  });

  factory JoinGroup.fromJson(Map<String, dynamic> json) => JoinGroup(
        id: json["id"],
        groupNumber: json["group_number"],
        name: json["name"],
        stage: json["stage"],
        founder: Founder.fromJson(json["founder"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "group_number": groupNumber,
        "name": name,
        "stage": stage,
        "founder": founder.toJson(),
      };
}

class Founder {
  int id;
  String name;
  String phone;

  Founder({
    required this.id,
    required this.name,
    required this.phone,
  });

  factory Founder.fromJson(Map<String, dynamic> json) => Founder(
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
