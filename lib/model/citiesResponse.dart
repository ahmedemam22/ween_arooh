// To parse this JSON data, do
//
//     final citiesResponse = citiesResponseFromJson(jsonString);

import 'dart:convert';

CitiesResponse citiesResponseFromJson(String str) => CitiesResponse.fromJson(json.decode(str));

String citiesResponseToJson(CitiesResponse data) => json.encode(data.toJson());

class CitiesResponse {
  CitiesResponse({
    this.code,
    this.message,
    this.result,
  });

  int code;
  String message;
  List<City> result;

  factory CitiesResponse.fromJson(Map<String, dynamic> json) => CitiesResponse(
    code: json["code"],
    message: json["message"],
    result: List<City>.from(json["result"].map((x) => City.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "code": code,
    "message": message,
    "result": List<dynamic>.from(result.map((x) => x.toJson())),
  };
}

class City {
  City({
    this.id,
    this.nameAr,
    this.nameEn,
    this.latitude,
    this.longitude,
    this.createdAt,
    this.updatedAt,
    this.cities,
    this.regionId,
  });

  int id;
  String nameAr;
  String nameEn;
  String latitude;
  String longitude;
  dynamic createdAt;
  dynamic updatedAt;
  List<City> cities;
  int regionId;

  factory City.fromJson(Map<String, dynamic> json) => City(
    id: json["id"],
    nameAr: json["name_ar"],
    nameEn: json["name_en"],
    latitude: json["latitude"],
    longitude: json["longitude"],
    createdAt: json["created_at"],
    updatedAt: json["updated_at"],
    cities: json["cities"] == null ? null : List<City>.from(json["cities"].map((x) => City.fromJson(x))),
    regionId: json["region_id"] == null ? null : json["region_id"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name_ar": nameAr,
    "name_en": nameEn,
    "latitude": latitude,
    "longitude": longitude,
    "created_at": createdAt,
    "updated_at": updatedAt,
    "cities": cities == null ? null : List<dynamic>.from(cities.map((x) => x.toJson())),
    "region_id": regionId == null ? null : regionId,
  };
}
