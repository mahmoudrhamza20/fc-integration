// To parse this JSON data, do
//
//     final getGovernmentModel = getGovernmentModelFromJson(jsonString);

import 'dart:convert';

GetGovernmentModel getGovernmentModelFromJson(String str) =>
    GetGovernmentModel.fromJson(json.decode(str));

String getGovernmentModelToJson(GetGovernmentModel data) =>
    json.encode(data.toJson());

class GetGovernmentModel {
  bool result;
  String message;
  int status;
  GovernmentData data;

  GetGovernmentModel({
    required this.result,
    required this.message,
    required this.status,
    required this.data,
  });

  factory GetGovernmentModel.fromJson(Map<String, dynamic> json) =>
      GetGovernmentModel(
        result: json["result"],
        message: json["message"],
        status: json["status"],
        data: GovernmentData.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "result": result,
        "message": message,
        "status": status,
        "data": data.toJson(),
      };
}

class GovernmentData {
  List<Governorate> governorates;

  GovernmentData({
    required this.governorates,
  });

  factory GovernmentData.fromJson(Map<String, dynamic> json) => GovernmentData(
        governorates: List<Governorate>.from(
            json["governorates"].map((x) => Governorate.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "governorates": List<dynamic>.from(governorates.map((x) => x.toJson())),
      };
}

class Governorate {
  int id;
  dynamic name;
  dynamic countryId;
  DateTime createdAt;
  DateTime updatedAt;

  Governorate({
    required this.id,
    required this.name,
    required this.countryId,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Governorate.fromJson(Map<String, dynamic> json) => Governorate(
        id: json["id"],
        name: json["name"],
        countryId: json["country_id"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "country_id": countryId,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
      };
}
