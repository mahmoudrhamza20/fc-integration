// // To parse this JSON data, do
// //
// //     final getStagesByIdModel = getStagesByIdModelFromJson(jsonString);

// import 'dart:convert';

// GetStagesByIdModel getStagesByIdModelFromJson(String str) =>
//     GetStagesByIdModel.fromJson(json.decode(str));

// String getStagesByIdModelToJson(GetStagesByIdModel data) =>
//     json.encode(data.toJson());

// class GetStagesByIdModel {
//   bool result;
//   String message;
//   int status;
//   GetStagesByIdData data;

//   GetStagesByIdModel({
//     required this.result,
//     required this.message,
//     required this.status,
//     required this.data,
//   });

//   factory GetStagesByIdModel.fromJson(Map<String, dynamic> json) =>
//       GetStagesByIdModel(
//         result: json["result"],
//         message: json["message"],
//         status: json["status"],
//         data: GetStagesByIdData.fromJson(json["data"]),
//       );

//   Map<String, dynamic> toJson() => {
//         "result": result,
//         "message": message,
//         "status": status,
//         "data": data.toJson(),
//       };
// }

// class GetStagesByIdData {
//   StageId stage;
//   List<SuggestedGroup> suggestedGroups;

//   GetStagesByIdData({
//     required this.stage,
//     required this.suggestedGroups,
//   });

//   factory GetStagesByIdData.fromJson(Map<String, dynamic> json) =>
//       GetStagesByIdData(
//         stage: StageId.fromJson(json["stage"]),
//         suggestedGroups: List<SuggestedGroup>.from(
//             json["suggestedGroups"].map((x) => SuggestedGroup.fromJson(x))),
//       );

//   Map<String, dynamic> toJson() => {
//         "stage": stage.toJson(),
//         "suggestedGroups":
//             List<dynamic>.from(suggestedGroups.map((x) => x.toJson())),
//       };
// }

// class StageId {
//   dynamic id;
//   dynamic name;
//   dynamic value;
//   String currency;
//   bool isCurrent;
//   bool isDone;

//   StageId({
//     required this.id,
//     required this.name,
//     required this.value,
//     required this.currency,
//     required this.isCurrent,
//     required this.isDone,
//   });

//   factory StageId.fromJson(Map<String, dynamic> json) => StageId(
//         id: json["id"],
//         name: json["name"],
//         value: json["value"],
//         currency: json["currency"],
//         isCurrent: json["is_current"],
//         isDone: json["is_done"],
//       );

//   Map<String, dynamic> toJson() => {
//         "id": id,
//         "name": name,
//         "value": value,
//         "currency": currency,
//         "is_current": isCurrent,
//         "is_done": isDone,
//       };
// }

// class SuggestedGroup {
//   int id;
//   String? groupNumber;

//   SuggestedGroup({
//     required this.id,
//     required this.groupNumber,
//   });

//   factory SuggestedGroup.fromJson(Map<String, dynamic> json) => SuggestedGroup(
//         id: json["id"],
//         groupNumber: json["group_number"],
//       );

//   Map<String, dynamic> toJson() => {
//         "id": id,
//         "group_number": groupNumber,
//       };
// }

// To parse this JSON data, do
//
//     final getStagesByIdModel = getStagesByIdModelFromJson(jsonString);

import 'dart:convert';

GetStagesByIdModel getStagesByIdModelFromJson(String str) =>
    GetStagesByIdModel.fromJson(json.decode(str));

String getStagesByIdModelToJson(GetStagesByIdModel data) =>
    json.encode(data.toJson());

class GetStagesByIdModel {
  bool result;
  String message;
  int status;
  GetStagesByIdData data;

  GetStagesByIdModel({
    required this.result,
    required this.message,
    required this.status,
    required this.data,
  });

  factory GetStagesByIdModel.fromJson(Map<String, dynamic> json) =>
      GetStagesByIdModel(
        result: json["result"],
        message: json["message"],
        status: json["status"],
        data: GetStagesByIdData.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "result": result,
        "message": message,
        "status": status,
        "data": data.toJson(),
      };
}

class GetStagesByIdData {
  StageId stage;
  List<SuggestedGroup> suggestedGroups;

  GetStagesByIdData({
    required this.stage,
    required this.suggestedGroups,
  });

  factory GetStagesByIdData.fromJson(Map<String, dynamic> json) =>
      GetStagesByIdData(
        stage: StageId.fromJson(json["stage"]),
        suggestedGroups: List<SuggestedGroup>.from(
            json["suggestedGroups"].map((x) => SuggestedGroup.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "stage": stage.toJson(),
        "suggestedGroups":
            List<dynamic>.from(suggestedGroups.map((x) => x.toJson())),
      };
}

class StageId {
  int id;
  String name;
  int value;
  String currency;
  bool isCurrent;
  bool isDone;

  StageId({
    required this.id,
    required this.name,
    required this.value,
    required this.currency,
    required this.isCurrent,
    required this.isDone,
  });

  factory StageId.fromJson(Map<String, dynamic> json) => StageId(
        id: json["id"],
        name: json["name"],
        value: json["value"],
        currency: json["currency"],
        isCurrent: json["is_current"],
        isDone: json["is_done"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "value": value,
        "currency": currency,
        "is_current": isCurrent,
        "is_done": isDone,
      };
}

class SuggestedGroup {
  int id;
  String groupNumber;
  String name;
  String stage;
  int value;
  String currency;
  Founder founder;

  SuggestedGroup({
    required this.id,
    required this.groupNumber,
    required this.name,
    required this.stage,
    required this.value,
    required this.currency,
    required this.founder,
  });

  factory SuggestedGroup.fromJson(Map<String, dynamic> json) => SuggestedGroup(
        id: json["id"],
        groupNumber: json["group_number"],
        name: json["name"],
        stage: json["stage"],
        value: json["value"],
        currency: json["currency"],
        founder: Founder.fromJson(json["founder"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "group_number": groupNumber,
        "name": name,
        "stage": stage,
        "value": value,
        "currency": currency,
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
