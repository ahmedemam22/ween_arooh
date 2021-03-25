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
  String value;
  DateTime endDate;
  String marketName;
  double latitude;
  double longitude;
  String location;

  factory Result.fromJson(Map<String, dynamic> json) => Result(
    id: json["id"],
    marketId: json["market_id"],
    code: json["code"],
    path: json["path"] == null ? null : json["path"],
    value: json["value"],
    endDate: DateTime.parse(json["end_date"]),
    marketName: json["market_name"],
    latitude: json["latitude"] == null ? null : json["latitude"],
    longitude: json["longitude"] == null ? null : json["longitude"],
    location: json["location"] == null ? null : json["location"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "market_id": marketId,
    "code": code,
    "path": path == null ? null : path,
    "value": value,
    "end_date": "${endDate.year.toString().padLeft(4, '0')}-${endDate.month.toString().padLeft(2, '0')}-${endDate.day.toString().padLeft(2, '0')}",
    "market_name": marketName,
    "latitude": latitude == null ? null : latitude,
    "longitude": longitude == null ? null : longitude,
    "location": location == null ? null : location,
  };
}
