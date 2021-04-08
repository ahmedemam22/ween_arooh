// To parse this JSON data, do
//
//     final userMarketModel = userMarketModelFromJson(jsonString);

import 'dart:convert';

UserMarketModel userMarketModelFromJson(String str) => UserMarketModel.fromJson(json.decode(str));

String userMarketModelToJson(UserMarketModel data) => json.encode(data.toJson());

class UserMarketModel {
  UserMarketModel({
    this.code,
    this.message,
    this.result,
  });

  int code;
  String message;
  List<Result> result;

  factory UserMarketModel.fromJson(Map<String, dynamic> json) => UserMarketModel(
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
    this.images,
    this.offers,
    this.coupons,
    this.admin,
    this.branches,
    this.recomendations,
    this.category,
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
  List<Image> images;
  List<Offer> offers;
  List<Coupon> coupons;
  Admin admin;
  List<dynamic> branches;
  List<Recomendation> recomendations;
  Category category;

  factory Result.fromJson(Map<String, dynamic> json) => Result(
    id: json["id"],
    titleAr: json["title_ar"],
    titleEn: json["title_en"],
    minDecAr: json["min_dec_ar"] == null ? null : json["min_dec_ar"],
    minDecEn: json["min_dec_en"],
    decAr: json["dec_ar"] == null ? null : json["dec_ar"],
    decEn: json["dec_en"],
    latitude: json["latitude"].toDouble(),
    longitude: json["longitude"].toDouble(),
    siteLink: json["site_link"] == null ? null : json["site_link"],
    email: json["email"] == null ? null : json["email"],
    facebook: json["facebook"] == null ? null : json["facebook"],
    youtube: json["youtube"] == null ? null : json["youtube"],
    twitter: json["twitter"] == null ? null : json["twitter"],
    linkedin: json["linkedin"] == null ? null : json["linkedin"],
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
    minDec: json["min_dec"] == null ? null : json["min_dec"],
    dec: json["dec"] == null ? null : json["dec"],
    logo: json["logo"],
    panner: json["panner"],
    visitscount: json["visitscount"],
    rate: json["rate"],
    images: List<Image>.from(json["images"].map((x) => Image.fromJson(x))),
    offers: List<Offer>.from(json["offers"].map((x) => Offer.fromJson(x))),
    coupons: List<Coupon>.from(json["coupons"].map((x) => Coupon.fromJson(x))),
    admin: Admin.fromJson(json["admin"]),
    branches: List<dynamic>.from(json["branches"].map((x) => x)),
    recomendations: List<Recomendation>.from(json["recomendations"].map((x) => Recomendation.fromJson(x))),
    category: Category.fromJson(json["category"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "title_ar": titleAr,
    "title_en": titleEn,
    "min_dec_ar": minDecAr == null ? null : minDecAr,
    "min_dec_en": minDecEn,
    "dec_ar": decAr == null ? null : decAr,
    "dec_en": decEn,
    "latitude": latitude,
    "longitude": longitude,
    "site_link": siteLink == null ? null : siteLink,
    "email": email == null ? null : email,
    "facebook": facebook == null ? null : facebook,
    "youtube": youtube == null ? null : youtube,
    "twitter": twitter == null ? null : twitter,
    "linkedin": linkedin == null ? null : linkedin,
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
    "min_dec": minDec == null ? null : minDec,
    "dec": dec == null ? null : dec,
    "logo": logo,
    "panner": panner,
    "visitscount": visitscount,
    "rate": rate,
    "images": List<dynamic>.from(images.map((x) => x.toJson())),
    "offers": List<dynamic>.from(offers.map((x) => x.toJson())),
    "coupons": List<dynamic>.from(coupons.map((x) => x.toJson())),
    "admin": admin.toJson(),
    "branches": List<dynamic>.from(branches.map((x) => x)),
    "recomendations": List<dynamic>.from(recomendations.map((x) => x.toJson())),
    "category": category.toJson(),
  };
}

class Admin {
  Admin({
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
  dynamic mobile2;
  String pic;
  dynamic latitude;
  dynamic longitude;
  int status;
  dynamic emailVerifiedAt;
  DateTime createdAt;
  DateTime updatedAt;
  String code;
  String codeExp;
  String path;
  String address;
  String name;

  factory Admin.fromJson(Map<String, dynamic> json) => Admin(
    id: json["id"],
    fName: json["f_name"],
    lName: json["l_name"],
    mobile: json["mobile"],
    mobile2: json["mobile2"],
    pic: json["pic"],
    latitude: json["latitude"],
    longitude: json["longitude"],
    status: json["status"],
    emailVerifiedAt: json["email_verified_at"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    code: json["code"],
    codeExp: json["codeExp"],
    path: json["path"],
    address: json["address"],
    name: json["name"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "f_name": fName,
    "l_name": lName,
    "mobile": mobile,
    "mobile2": mobile2,
    "pic": pic,
    "latitude": latitude,
    "longitude": longitude,
    "status": status,
    "email_verified_at": emailVerifiedAt,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
    "code": code,
    "codeExp": codeExp,
    "path": path,
    "address": address,
    "name": name,
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
  String minDescEn;
  String minDescAr;
  String descEn;
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
    minDescEn: json["min_desc_en"] == null ? null : json["min_desc_en"],
    minDescAr: json["min_desc_ar"] == null ? null : json["min_desc_ar"],
    descEn: json["desc_en"] == null ? null : json["desc_en"],
    descAr: json["desc_ar"] == null ? null : json["desc_ar"],
    logo: json["logo"],
    visitsCount: json["visits_count"],
    parentId: json["parent_id"],
    cost: json["cost"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    path: json["path"],
    name: json["name"],
    mindesc: json["mindesc"] == null ? null : json["mindesc"],
    desc: json["desc"] == null ? null : json["desc"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name_ar": nameAr,
    "name_en": nameEn,
    "min_desc_en": minDescEn == null ? null : minDescEn,
    "min_desc_ar": minDescAr == null ? null : minDescAr,
    "desc_en": descEn == null ? null : descEn,
    "desc_ar": descAr == null ? null : descAr,
    "logo": logo,
    "visits_count": visitsCount,
    "parent_id": parentId,
    "cost": cost,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
    "path": path,
    "name": name,
    "mindesc": mindesc == null ? null : mindesc,
    "desc": desc == null ? null : desc,
  };
}

class Coupon {
  Coupon({
    this.id,
    this.code,
    this.image,
    this.percentage,
    this.expireDate,
    this.marketId,
    this.createdAt,
    this.updatedAt,
    this.path,
  });

  int id;
  String code;
  String image;
  dynamic percentage;
  dynamic expireDate;
  int marketId;
  dynamic createdAt;
  dynamic updatedAt;
  String path;

  factory Coupon.fromJson(Map<String, dynamic> json) => Coupon(
    id: json["id"],
    code: json["code"],
    image: json["image"],
    percentage: json["percentage"],
    expireDate: json["expire_date"],
    marketId: json["market_id"],
    createdAt: json["created_at"],
    updatedAt: json["updated_at"],
    path: json["path"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "code": code,
    "image": image,
    "percentage": percentage,
    "expire_date": expireDate,
    "market_id": marketId,
    "created_at": createdAt,
    "updated_at": updatedAt,
    "path": path,
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
