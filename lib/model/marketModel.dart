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
  Result result;

  factory MarketModel.fromJson(Map<String, dynamic> json) => MarketModel(
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
    this.currentPage,
    this.data,
    this.firstPageUrl,
    this.from,
    this.lastPage,
    this.lastPageUrl,
    this.nextPageUrl,
    this.path,
    this.perPage,
    this.prevPageUrl,
    this.to,
    this.total,
  });

  int currentPage;
  List<Market> data;
  String firstPageUrl;
  int from;
  int lastPage;
  String lastPageUrl;
  String nextPageUrl;
  String path;
  int perPage;
  dynamic prevPageUrl;
  int to;
  int total;

  factory Result.fromJson(Map<String, dynamic> json) => Result(
    currentPage: json["current_page"],
    data: List<Market>.from(json["data"].map((x) => Market.fromJson(x))),
    firstPageUrl: json["first_page_url"],
    from: json["from"],
    lastPage: json["last_page"],
    lastPageUrl: json["last_page_url"],
    nextPageUrl: json["next_page_url"],
    path: json["path"],
    perPage: json["per_page"],
    prevPageUrl: json["prev_page_url"],
    to: json["to"],
    total: json["total"],
  );

  Map<String, dynamic> toJson() => {
    "current_page": currentPage,
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
    "first_page_url": firstPageUrl,
    "from": from,
    "last_page": lastPage,
    "last_page_url": lastPageUrl,
    "next_page_url": nextPageUrl,
    "path": path,
    "per_page": perPage,
    "prev_page_url": prevPageUrl,
    "to": to,
    "total": total,
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
    this.mobile,
    this.location,
    this.cityId,
    this.regionId,
    this.distance,
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
  String decAr;
  String decEn;
  double latitude;
  double longitude;
  String siteLink;
  String email;
  String facebook;
  String youtube;
  String twitter;
  String linkedin;
  int parentId;
  int categoryId;
  int adminId;
  DateTime createdAt;
  DateTime updatedAt;
  dynamic deletedAt;
  int isManagement;
  dynamic mobile;
  String location;
  int cityId;
  int regionId;
  double distance;
  String title;
  String minDec;
  String dec;
  String logo;
  String panner;
  int visitscount;
  double rate;

  factory Market.fromJson(Map<String, dynamic> json) => Market(
    id: json["id"],
    titleAr: json["title_ar"],
    titleEn: json["title_en"],
    minDecAr: json["min_dec_ar"] == null ? null : json["min_dec_ar"],
    minDecEn: json["min_dec_en"] == null ? null : json["min_dec_en"],
    decAr: json["dec_ar"] == null ? null : json["dec_ar"],
    decEn: json["dec_en"] == null ? null : json["dec_en"],
    latitude: json["latitude"].toDouble(),
    longitude: json["longitude"].toDouble(),
    siteLink: json["site_link"],
    email: json["email"] == null ? null : json["email"],
    facebook: json["facebook"] == null ? null : json["facebook"],
    youtube: json["youtube"] == null ? null : json["youtube"],
    twitter: json["twitter"],
    linkedin: json["linkedin"],
    parentId: json["parent_id"] == null ? null : json["parent_id"],
    categoryId: json["category_id"],
    adminId: json["admin_id"] == null ? null : json["admin_id"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    deletedAt: json["deleted_at"],
    isManagement: json["is_management"],
    mobile: json["mobile"],
    location: json["location"],
    cityId: json["city_id"],
    regionId: json["region_id"],
    distance: json["distance"].toDouble(),
    title: json["title"],
    minDec: json["min_dec"] == null ? null : json["min_dec"],
    dec: json["dec"] == null ? null : json["dec"],
    logo: json["logo"] == null ? null : json["logo"],
    panner: json["panner"] == null ? null : json["panner"],
    visitscount: json["visitscount"],
    rate: json["rate"].toDouble(),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "title_ar": titleAr,
    "title_en": titleEn,
    "min_dec_ar": minDecAr == null ? null : minDecAr,
    "min_dec_en": minDecEn == null ? null : minDecEn,
    "dec_ar": decAr == null ? null : decAr,
    "dec_en": decEn == null ? null : decEn,
    "latitude": latitude,
    "longitude": longitude,
    "site_link": siteLink,
    "email": email == null ? null : email,
    "facebook": facebook == null ? null : facebook,
    "youtube": youtube == null ? null : youtube,
    "twitter": twitter,
    "linkedin": linkedin,
    "parent_id": parentId == null ? null : parentId,
    "category_id": categoryId,
    "admin_id": adminId == null ? null : adminId,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
    "deleted_at": deletedAt,
    "is_management": isManagement,
    "mobile": mobile,
    "location": location,
    "city_id": cityId,
    "region_id": regionId,
    "distance": distance,
    "title": title,
    "min_dec": minDec == null ? null : minDec,
    "dec": dec == null ? null : dec,
    "logo": logo == null ? null : logo,
    "panner": panner == null ? null : panner,
    "visitscount": visitscount,
    "rate": rate,
  };
}
