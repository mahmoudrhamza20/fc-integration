// To parse this JSON data, do
//
//     final searchKeywordsModel = searchKeywordsModelFromJson(jsonString);

import 'dart:convert';

SearchKeywordsModel searchKeywordsModelFromJson(String str) =>
    SearchKeywordsModel.fromJson(json.decode(str));

String searchKeywordsModelToJson(SearchKeywordsModel data) =>
    json.encode(data.toJson());

class SearchKeywordsModel {
  bool result;
  String message;
  int status;
  SearchKeywordsData data;

  SearchKeywordsModel({
    required this.result,
    required this.message,
    required this.status,
    required this.data,
  });

  factory SearchKeywordsModel.fromJson(Map<String, dynamic> json) =>
      SearchKeywordsModel(
        result: json["result"],
        message: json["message"],
        status: json["status"],
        data: SearchKeywordsData.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "result": result,
        "message": message,
        "status": status,
        "data": data.toJson(),
      };
}

class SearchKeywordsData {
  List<String> groups;

  SearchKeywordsData({
    required this.groups,
  });

  factory SearchKeywordsData.fromJson(Map<String, dynamic> json) =>
      SearchKeywordsData(
        groups: List<String>.from(json["groups"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "groups": List<dynamic>.from(groups.map((x) => x)),
      };
}
