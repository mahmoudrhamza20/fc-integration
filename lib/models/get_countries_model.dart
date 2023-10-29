// To parse this JSON data, do
//
//     final getCountriesModel = getCountriesModelFromJson(jsonString);

import 'dart:convert';

GetCountriesModel getCountriesModelFromJson(String str) =>
    GetCountriesModel.fromJson(json.decode(str));

String getCountriesModelToJson(GetCountriesModel data) =>
    json.encode(data.toJson());

class GetCountriesModel {
  bool result;
  String message;
  int status;
  CountriesData data;

  GetCountriesModel({
    required this.result,
    required this.message,
    required this.status,
    required this.data,
  });

  factory GetCountriesModel.fromJson(Map<String, dynamic> json) =>
      GetCountriesModel(
        result: json["result"],
        message: json["message"],
        status: json["status"],
        data: CountriesData.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "result": result,
        "message": message,
        "status": status,
        "data": data.toJson(),
      };
}

class CountriesData {
  List<Country> countries;

  CountriesData({
    required this.countries,
  });

  factory CountriesData.fromJson(Map<String, dynamic> json) => CountriesData(
        countries: List<Country>.from(
            json["countries"].map((x) => Country.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "countries": List<dynamic>.from(countries.map((x) => x.toJson())),
      };
}

class Country {
  int id;
  String name;
  String iso;
  String flag;
  String currency;
  String currencySymbol;
  String maxNumber;
  String countryCode;
  DateTime createdAt;
  DateTime updatedAt;

  Country({
    required this.id,
    required this.name,
    required this.iso,
    required this.flag,
    required this.currency,
    required this.currencySymbol,
    required this.maxNumber,
    required this.countryCode,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Country.fromJson(Map<String, dynamic> json) => Country(
        id: json["id"],
        name: json["name"],
        iso: json["iso"],
        flag: json["flag"],
        currency: json["currency"],
        currencySymbol: json["currency_symbol"],
        maxNumber: json["max_number"],
        countryCode: json["country_code"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "iso": iso,
        "flag": flag,
        "currency": currency,
        "currency_symbol": currencySymbol,
        "max_number": maxNumber,
        "country_code": countryCode,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
      };
}
