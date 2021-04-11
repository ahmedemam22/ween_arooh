// To parse this JSON data, do
//
//     final offersModel = offersModelFromJson(jsonString);

import 'dart:convert';
import 'dart:io';

import 'package:ween_arooh/model/NewUserMarketModel.dart';

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
    this.titleAr,
    this.titleEn,
    this.minDecAr,
    this.minDecEn,
    this.decAr,
    this.decEn,
    this.latitude,
    this.longitude,
    this.siteLink,
    this.email,
    this.facebook,
    this.youtube,
    this.twitter,
    this.linkedin,
    this.parentId,
    this.categoryId,
    this.adminId,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
    this.isManagement,
    this.mobile,
    this.location,
    this.cityId,
    this.regionId,
    this.title,
    this.minDec,
    this.dec,
    this.logo,
    this.panner,
    this.visitscount,
    this.rate,
    this.offers,
  });

  int id;
  String titleAr;
  dynamic titleEn;
  String minDecAr;
  dynamic minDecEn;
  String decAr;
  dynamic decEn;
  double latitude;
  double longitude;
  String siteLink;
  String email;
  dynamic facebook;
  dynamic youtube;
  dynamic twitter;
  dynamic linkedin;
  int parentId;
  int categoryId;
  int adminId;
  DateTime createdAt;
  DateTime updatedAt;
  dynamic deletedAt;
  int isManagement;
  String mobile;
  String location;
  int cityId;
  int regionId;
  String title;
  String minDec;
  String dec;
  String logo;
  String panner;
  int visitscount;
  int rate;
  List<Offer> offers;
  List<Coupons> coupons;

  factory Result.fromJson(Map<String, dynamic> json) => Result(
    id: json["id"],
    titleAr: json["title_ar"],
    titleEn: json["title_en"],
    minDecAr: json["min_dec_ar"],
    minDecEn: json["min_dec_en"],
    decAr: json["dec_ar"],
    decEn: json["dec_en"],
    latitude: json["latitude"].toDouble(),
    longitude: json["longitude"].toDouble(),
    siteLink: json["site_link"],
    email: json["email"],
    facebook: json["facebook"],
    youtube: json["youtube"],
    twitter: json["twitter"],
    linkedin: json["linkedin"],
    parentId: json["parent_id"],
    categoryId: json["category_id"],
    adminId: json["admin_id"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    deletedAt: json["deleted_at"],
    isManagement: json["is_management"],
    mobile: json["mobile"],
    location: json["location"],
    cityId: json["city_id"],
    regionId: json["region_id"],
    title: json["title"],
    minDec: json["min_dec"],
    dec: json["dec"],
    logo: json["logo"],
    panner: json["panner"],
    visitscount: json["visitscount"],
    rate: json["rate"],
    offers: List<Offer>.from(json["offers"].map((x) => Offer.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "title_ar": titleAr,
    "title_en": titleEn,
    "min_dec_ar": minDecAr,
    "min_dec_en": minDecEn,
    "dec_ar": decAr,
    "dec_en": decEn,
    "latitude": latitude,
    "longitude": longitude,
    "site_link": siteLink,
    "email": email,
    "facebook": facebook,
    "youtube": youtube,
    "twitter": twitter,
    "linkedin": linkedin,
    "parent_id": parentId,
    "category_id": categoryId,
    "admin_id": adminId,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
    "deleted_at": deletedAt,
    "is_management": isManagement,
    "mobile": mobile,
    "location": location,
    "city_id": cityId,
    "region_id": regionId,
    "title": title,
    "min_dec": minDec,
    "dec": dec,
    "logo": logo,
    "panner": panner,
    "visitscount": visitscount,
    "rate": rate,
    "offers": List<dynamic>.from(offers.map((x) => x.toJson())),
  };
}

class Offer {
  Offer({
    this.id,
    this.marketId,
    this.code,
    this.pic,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
    this.order,
    this.path,
  });

  int id;
  int marketId;
  String code;
  String pic;
  dynamic createdAt;
  dynamic updatedAt;
  dynamic deletedAt;
  int order;
  String path;

  factory Offer.fromJson(Map<String, dynamic> json) => Offer(
    id: json["id"],
    marketId: json["market_id"],
    code: json["code"],
    pic: json["pic"],
    createdAt: json["created_at"],
    updatedAt: json["updated_at"],
    deletedAt: json["deleted_at"],
    order: json["order"],
    path: json["path"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "market_id": marketId,
    "code": code,
    "pic": pic,
    "created_at": createdAt,
    "updated_at": updatedAt,
    "deleted_at": deletedAt,
    "order": order,
    "path": path,
  };
}

class ScreenArguments {
  final Result item;
  final int ListCount;
  final int StartIndex;
  final List<Result> ListData;

  ScreenArguments(this.item, this.ListCount, this.ListData, this.StartIndex);
}

class VideoArguments {
  final File Fileitem;
  final bool network;
  final Offers Offeritem;

  VideoArguments(this.Fileitem, this.network, this.Offeritem);
}