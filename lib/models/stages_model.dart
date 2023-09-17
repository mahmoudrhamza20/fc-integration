// To parse this JSON data, do
//
//     final getStagesModel = getStagesModelFromJson(jsonString);

import 'dart:convert';

StagesModel getStagesModelFromJson(String str) =>
    StagesModel.fromJson(json.decode(str));

String getStagesModelToJson(StagesModel data) => json.encode(data.toJson());

class StagesModel {
  bool result;
  String message;
  int status;
  StagesData data;

  StagesModel({
    required this.result,
    required this.message,
    required this.status,
    required this.data,
  });

  factory StagesModel.fromJson(Map<String, dynamic> json) => StagesModel(
        result: json["result"],
        message: json["message"],
        status: json["status"],
        data: StagesData.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "result": result,
        "message": message,
        "status": status,
        "data": data.toJson(),
      };
}

class StagesData {
  List<Stage> stages;

  StagesData({
    required this.stages,
  });

  factory StagesData.fromJson(Map<String, dynamic> json) => StagesData(
        stages: List<Stage>.from(json["stages"].map((x) => Stage.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "stages": List<dynamic>.from(stages.map((x) => x.toJson())),
      };
}

class Stage {
  int id;
  String name;
  dynamic value;
  dynamic currency;
  dynamic isCurrent;
  dynamic isDone;

  Stage({
    required this.id,
    required this.name,
    required this.value,
    required this.currency,
    required this.isCurrent,
    required this.isDone,
  });

  factory Stage.fromJson(Map<String, dynamic> json) => Stage(
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
