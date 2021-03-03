// To parse this JSON data, do
//
//     final marketModel = marketModelFromJson(jsonString);

import 'dart:convert';

MarketModel marketModelFromJson(String str) => MarketModel.fromJson(json.decode(str));

String marketModelToJson(MarketModel data) => json.encode(data.toJson());

class MarketModel {
  MarketModel({
    this.code,
    this.message,
    this.result,
  });

  int code;
  String message;
  List<Result> result;

  factory MarketModel.fromJson(Map<String, dynamic> json) => MarketModel(
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
    this.titleAr,
    this.titleEn,
    this.minDecAr,
    this.minDecEn,
    this.latitude,
    this.longitude,
    this.title,
    this.minDec,
    this.dec,
    this.logo,
    this.panner,
    this.visitscount,
    this.rate,
  });

  int id;
  String titleAr;
  String titleEn;
  String minDecAr;
  String minDecEn;
  String latitude;
  String longitude;
  String title;
  String minDec;
  dynamic dec;
  dynamic logo;
  String panner;
  dynamic visitscount;
  double rate;

  factory Result.fromJson(Map<String, dynamic> json) => Result(
    id: json["id"],
    titleAr: json["title_ar"],
    titleEn: json["title_en"],
    minDecAr: json["min_dec_ar"] == null ? null : json["min_dec_ar"],
    minDecEn: json["min_dec_en"] == null ? null : json["min_dec_en"],
    latitude: json["latitude"] == null ? null : json["latitude"],
    longitude: json["longitude"] == null ? null : json["longitude"],
    title: json["title"],
    minDec: json["min_dec"] == null ? null : json["min_dec"],
    dec: json["dec"],
    logo: json["logo"],
    panner: json["panner"],
    visitscount: json["visitscount"],
    rate: json["rate"].toDouble(),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "title_ar": titleAr,
    "title_en": titleEn,
    "min_dec_ar": minDecAr == null ? null : minDecAr,
    "min_dec_en": minDecEn == null ? null : minDecEn,
    "latitude": latitude == null ? null : latitude,
    "longitude": longitude == null ? null : longitude,
    "title": title,
    "min_dec": minDec == null ? null : minDec,
    "dec": dec,
    "logo": logo,
    "panner": panner,
    "visitscount": visitscount,
    "rate": rate,
  };
}
