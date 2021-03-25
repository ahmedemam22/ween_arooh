// To parse this JSON data, do
//
//     final marketDetailsResponse = marketDetailsResponseFromJson(jsonString);

import 'dart:convert';

MarketDetailsResponse marketDetailsResponseFromJson(String str) => MarketDetailsResponse.fromJson(json.decode(str));

String marketDetailsResponseToJson(MarketDetailsResponse data) => json.encode(data.toJson());

class MarketDetailsResponse {
  MarketDetailsResponse({
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
    this.category,
    this.images,
    this.offers,
    this.recomendations,
    this.branches,
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
  Category category;
  List<Image> images;
  List<Offer> offers;
  List<Recomendation> recomendations;
  List<dynamic> branches;

  factory MarketDetailsResponse.fromJson(Map<String, dynamic> json) => MarketDetailsResponse(
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
    category: Category.fromJson(json["category"]),
    images: List<Image>.from(json["images"].map((x) => Image.fromJson(x))),
    offers: List<Offer>.from(json["offers"].map((x) => Offer.fromJson(x))),
    recomendations: List<Recomendation>.from(json["recomendations"].map((x) => Recomendation.fromJson(x))),
    branches: List<dynamic>.from(json["branches"].map((x) => x)),
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
    "category": category.toJson(),
    "images": List<dynamic>.from(images.map((x) => x.toJson())),
    "offers": List<dynamic>.from(offers.map((x) => x.toJson())),
    "recomendations": List<dynamic>.from(recomendations.map((x) => x.toJson())),
    "branches": List<dynamic>.from(branches.map((x) => x)),
  };
}

class Category {
  Category({
    this.id,
    this.nameAr,
    this.nameEn,
    this.minDescEn,
    this.minDescAr,
    this.descEn,
    this.descAr,
    this.logo,
    this.visitsCount,
    this.parentId,
    this.cost,
    this.createdAt,
    this.updatedAt,
    this.path,
    this.name,
    this.mindesc,
    this.desc,
  });

  int id;
  String nameAr;
  String nameEn;
  dynamic minDescEn;
  String minDescAr;
  dynamic descEn;
  String descAr;
  String logo;
  int visitsCount;
  int parentId;
  dynamic cost;
  DateTime createdAt;
  DateTime updatedAt;
  String path;
  String name;
  String mindesc;
  String desc;

  factory Category.fromJson(Map<String, dynamic> json) => Category(
    id: json["id"],
    nameAr: json["name_ar"],
    nameEn: json["name_en"],
    minDescEn: json["min_desc_en"],
    minDescAr: json["min_desc_ar"],
    descEn: json["desc_en"],
    descAr: json["desc_ar"],
    logo: json["logo"],
    visitsCount: json["visits_count"],
    parentId: json["parent_id"],
    cost: json["cost"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    path: json["path"],
    name: json["name"],
    mindesc: json["mindesc"],
    desc: json["desc"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name_ar": nameAr,
    "name_en": nameEn,
    "min_desc_en": minDescEn,
    "min_desc_ar": minDescAr,
    "desc_en": descEn,
    "desc_ar": descAr,
    "logo": logo,
    "visits_count": visitsCount,
    "parent_id": parentId,
    "cost": cost,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
    "path": path,
    "name": name,
    "mindesc": mindesc,
    "desc": desc,
  };
}

class Image {
  Image({
    this.id,
    this.marketId,
    this.name,
    this.type,
    this.periority,
    this.pageLoca,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
    this.path,
  });

  int id;
  int marketId;
  String name;
  int type;
  int periority;
  String pageLoca;
  DateTime createdAt;
  DateTime updatedAt;
  dynamic deletedAt;
  String path;

  factory Image.fromJson(Map<String, dynamic> json) => Image(
    id: json["id"],
    marketId: json["market_id"],
    name: json["name"],
    type: json["type"],
    periority: json["periority"],
    pageLoca: json["page_loca"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    deletedAt: json["deleted_at"],
    path: json["path"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "market_id": marketId,
    "name": name,
    "type": type,
    "periority": periority,
    "page_loca": pageLoca,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
    "deleted_at": deletedAt,
    "path": path,
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
  DateTime createdAt;
  DateTime updatedAt;
  dynamic deletedAt;
  int order;
  String path;

  factory Offer.fromJson(Map<String, dynamic> json) => Offer(
    id: json["id"],
    marketId: json["market_id"],
    code: json["code"],
    pic: json["pic"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    deletedAt: json["deleted_at"],
    order: json["order"],
    path: json["path"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "market_id": marketId,
    "code": code,
    "pic": pic,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
    "deleted_at": deletedAt,
    "order": order,
    "path": path,
  };
}

class Recomendation {
  Recomendation({
    this.id,
    this.marketId,
    this.userId,
    this.rate,
    this.comment,
    this.visitsCount,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
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

  factory Recomendation.fromJson(Map<String, dynamic> json) => Recomendation(
    id: json["id"],
    marketId: json["market_id"],
    userId: json["user_id"],
    rate: json["rate"],
    comment: json["comment"],
    visitsCount: json["visits_count"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    deletedAt: json["deleted_at"],
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
  };
}
