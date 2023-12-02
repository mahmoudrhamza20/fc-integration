// To parse this JSON data, do
//
//     final getCitiesModel = getCitiesModelFromJson(jsonString);

import 'dart:convert';

GetCitiesModel getCitiesModelFromJson(String str) =>
    GetCitiesModel.fromJson(json.decode(str));

String getCitiesModelToJson(GetCitiesModel data) => json.encode(data.toJson());

class GetCitiesModel {
  bool result;
  String message;
  int status;
  CitiesData data;

  GetCitiesModel({
    required this.result,
    required this.message,
    required this.status,
    required this.data,
  });

  factory GetCitiesModel.fromJson(Map<String, dynamic> json) => GetCitiesModel(
        result: json["result"],
        message: json["message"],
        status: json["status"],
        data: CitiesData.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "result": result,
        "message": message,
        "status": status,
        "data": data.toJson(),
      };
}

class CitiesData {
  List<City> cities;

  CitiesData({
    required this.cities,
  });

  factory CitiesData.fromJson(Map<String, dynamic> json) => CitiesData(
        cities: List<City>.from(json["cities"].map((x) => City.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "cities": List<dynamic>.from(cities.map((x) => x.toJson())),
      };
}

class City {
  int id;
  dynamic name;

  City({
    required this.id,
    required this.name,
  });

  factory City.fromJson(Map<String, dynamic> json) => City(
        id: json["id"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
      };
}
