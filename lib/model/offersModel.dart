// To parse this JSON data, do
//
//     final offersModel = offersModelFromJson(jsonString);

import 'dart:convert';

OffersModel offersModelFromJson(String str) => OffersModel.fromJson(json.decode(str));

String offersModelToJson(OffersModel data) => json.encode(data.toJson());

class OffersModel {
  OffersModel({
    this.code,
    this.message,
    this.result,
  });

  int code;
  String message;
  List<Result> result;

  factory OffersModel.fromJson(Map<String, dynamic> json) => OffersModel(
    code: json["code"],
    message: json["message"],
    result: List<Result>.from(json["result"].map((x) => Result.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "code": code,
    "message": message,
    "result": List<dynamic>.from(result.map((x) => x.toJson())),
  };
}

class Result {
  Result({
    this.id,
    this.marketId,
    this.code,
    this.path,
    this.value,
    this.endDate,
    this.marketName,
    this.latitude,
    this.longitude,
    this.location,
  });

  int id;
  int marketId;
  String code;
  String path;
  dynamic value;
  dynamic endDate;
  String marketName;
  double latitude;
  double longitude;
  String location;

  factory Result.fromJson(Map<String, dynamic> json) => Result(
    id: json["id"],
    marketId: json["market_id"],
    code: json["code"],
    path: json["path"],
    value: json["value"],
    endDate: json["end_date"],
    marketName: json["market_name"],
    latitude: json["latitude"].toDouble(),
    longitude: json["longitude"].toDouble(),
    location: json["location"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "market_id": marketId,
    "code": code,
    "path": path,
    "value": value,
    "end_date": endDate,
    "market_name": marketName,
    "latitude": latitude,
    "longitude": longitude,
    "location": location,
  };
}
