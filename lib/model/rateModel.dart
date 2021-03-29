// To parse this JSON data, do
//
//     final rateModel = rateModelFromJson(jsonString);

import 'dart:convert';

RateModel rateModelFromJson(String str) => RateModel.fromJson(json.decode(str));

String rateModelToJson(RateModel data) => json.encode(data.toJson());

class RateModel {
  RateModel({
    this.code,
    this.message,
    this.result,
  });

  int code;
  String message;
  Result result;

  factory RateModel.fromJson(Map<String, dynamic> json) => RateModel(
    code: json["code"],
    message: json["message"],
    result: Result.fromJson(json["result"]),
  );

  Map<String, dynamic> toJson() => {
    "code": code,
    "message": message,
    "result": result.toJson(),
  };
}

class Result {
  Result({
    this.market,
    this.count,
  });

  List<Market> market;
  Map<String, int> count;

  factory Result.fromJson(Map<String, dynamic> json) => Result(
    market: List<Market>.from(json["market"].map((x) => Market.fromJson(x))),
    count: Map.from(json["count"]).map((k, v) => MapEntry<String, int>(k, v)),
  );

  Map<String, dynamic> toJson() => {
    "market": List<dynamic>.from(market.map((x) => x.toJson())),
    "count": Map.from(count).map((k, v) => MapEntry<String, dynamic>(k, v)),
  };
}

class Market {
  Market({
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
    this.title,
    this.minDec,
    this.dec,
    this.logo,
    this.panner,
    this.visitscount,
    this.rate,
    this.location,
    this.recomendations,
  });

  int id;
  String titleAr;
  String titleEn;
  dynamic minDecAr;
  dynamic minDecEn;
  dynamic decAr;
  dynamic decEn;
  double latitude;
  double longitude;
  String siteLink;
  dynamic email;
  String facebook;
  String youtube;
  String twitter;
  String linkedin;
  dynamic parentId;
  int categoryId;
  dynamic adminId;
  DateTime createdAt;
  DateTime updatedAt;
  dynamic deletedAt;
  int isManagement;
  String title;
  dynamic minDec;
  dynamic dec;
  String logo;
  String panner;
  String visitscount;
  double rate;
  String location;
  List<Recomendations> recomendations;

  factory Market.fromJson(Map<String, dynamic> json) => Market(
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
    title: json["title"],
    minDec: json["min_dec"],
    dec: json["dec"],
    logo: json["logo"],
    panner: json["panner"],
    visitscount: json["visitscount"],
    rate: json["rate"].toDouble(),
    location: json["location"],
    recomendations: List<Recomendations>.from(json["recomendations"].map((x) => Recomendations.fromJson(x))),
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
    "title": title,
    "min_dec": minDec,
    "dec": dec,
    "logo": logo,
    "panner": panner,
    "visitscount": visitscount,
    "rate": rate,
    "location": location,
    "recomendations": List<dynamic>.from(recomendations.map((x) => x.toJson())),
  };
}

class Recomendations {
  Recomendations({
    this.id,
    this.marketId,
    this.userId,
    this.rate,
    this.comment,
    this.visitsCount,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
    this.user,
  });

  int id;
  int marketId;
  int userId;
  int rate;
  String comment;
  int visitsCount;
  DateTime createdAt;
  DateTime updatedAt;
  dynamic deletedAt;
  User user;

  factory Recomendations.fromJson(Map<String, dynamic> json) => Recomendations(
    id: json["id"],
    marketId: json["market_id"],
    userId: json["user_id"],
    rate: json["rate"],
    comment: json["comment"],
    visitsCount: json["visits_count"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    deletedAt: json["deleted_at"],
    user: User.fromJson(json["user"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "market_id": marketId,
    "user_id": userId,
    "rate": rate,
    "comment": comment,
    "visits_count": visitsCount,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
    "deleted_at": deletedAt,
    "user": user.toJson(),
  };
}

class User {
  User({
    this.id,
    this.fName,
    this.lName,
    this.mobile,
    this.mobile2,
    this.pic,
    this.latitude,
    this.longitude,
    this.status,
    this.emailVerifiedAt,
    this.createdAt,
    this.updatedAt,
    this.code,
    this.codeExp,
    this.path,
    this.address,
    this.name,
  });

  int id;
  String fName;
  String lName;
  String mobile;
  String mobile2;
  String pic;
  String latitude;
  String longitude;
  int status;
  dynamic emailVerifiedAt;
  DateTime createdAt;
  DateTime updatedAt;
  String code;
  String codeExp;
  String path;
  String address;
  String name;

  factory User.fromJson(Map<String, dynamic> json) => User(
    id: json["id"],
    fName: json["f_name"],
    lName: json["l_name"],
    mobile: json["mobile"],
    mobile2: json["mobile2"] == null ? null : json["mobile2"],
    pic: json["pic"] == null ? null : json["pic"],
    latitude: json["latitude"] == null ? null : json["latitude"],
    longitude: json["longitude"] == null ? null : json["longitude"],
    status: json["status"],
    emailVerifiedAt: json["email_verified_at"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    code: json["code"] == null ? null : json["code"],
    codeExp: json["codeExp"] == null ? null : json["codeExp"],
    path: json["path"] == null ? null : json["path"],
    address: json["address"],
    name: json["name"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "f_name": fName,
    "l_name": lName,
    "mobile": mobile,
    "mobile2": mobile2 == null ? null : mobile2,
    "pic": pic == null ? null : pic,
    "latitude": latitude == null ? null : latitude,
    "longitude": longitude == null ? null : longitude,
    "status": status,
    "email_verified_at": emailVerifiedAt,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
    "code": code == null ? null : code,
    "codeExp": codeExp == null ? null : codeExp,
    "path": path == null ? null : path,
    "address": address,
    "name": name,
  };
}
