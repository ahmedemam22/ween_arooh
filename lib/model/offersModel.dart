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
    this.titleAr,
    this.titleEn,
    this.minDecAr,
    this.minDecEn,
    this.decAr,
    this.decEn,
    this.latitude,
    this.longitude,
    this.location,
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
    this.offers,
    this.images,
    this.admin,
    this.branches,
    this.recomendations,
    this.category,
  });

  int id;
  String titleAr;
  String titleEn;
  String minDecAr;
  String minDecEn;
  String decAr;
  String decEn;
  String latitude;
  String longitude;
  String location;
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
  String title;
  String minDec;
  String dec;
  String logo;
  String panner;
  dynamic visitscount;
  double rate;
  List<Offer> offers;
  List<Image> images;
  Admin admin;
  List<Branch> branches;
  List<Recomendation> recomendations;
  Category category;

  factory Result.fromJson(Map<String, dynamic> json) => Result(
    id: json["id"],
    titleAr: json["title_ar"],
    titleEn: json["title_en"],
    minDecAr: json["min_dec_ar"] == null ? null : json["min_dec_ar"],
    minDecEn: json["min_dec_en"] == null ? null : json["min_dec_en"],
    decAr: json["dec_ar"] == null ? null : json["dec_ar"],
    decEn: json["dec_en"] == null ? null : json["dec_en"],
    latitude: json["latitude"] == null ? null : json["latitude"],
    longitude: json["longitude"] == null ? null : json["longitude"],
    location: json["location"] == null ? null : json["location"],
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
    title: json["title"],
    minDec: json["min_dec"] == null ? null : json["min_dec"],
    dec: json["dec"] == null ? null : json["dec"],
    logo: json["logo"] == null ? null : json["logo"],
    panner: json["panner"],
    visitscount: json["visitscount"],
    rate: json["rate"].toDouble(),
    offers: List<Offer>.from(json["offers"].map((x) => Offer.fromJson(x))),
    images: List<Image>.from(json["images"].map((x) => Image.fromJson(x))),
    admin: json["admin"] == null ? null : Admin.fromJson(json["admin"]),
    branches: List<Branch>.from(json["branches"].map((x) => Branch.fromJson(x))),
    recomendations: List<Recomendation>.from(json["recomendations"].map((x) => Recomendation.fromJson(x))),
    category: Category.fromJson(json["category"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "title_ar": titleAr,
    "title_en": titleEn,
    "min_dec_ar": minDecAr == null ? null : minDecAr,
    "min_dec_en": minDecEn == null ? null : minDecEn,
    "dec_ar": decAr == null ? null : decAr,
    "dec_en": decEn == null ? null : decEn,
    "latitude": latitude == null ? null : latitude,
    "longitude": longitude == null ? null : longitude,
    "location": location == null ? null : location,
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
    "title": title,
    "min_dec": minDec == null ? null : minDec,
    "dec": dec == null ? null : dec,
    "logo": logo == null ? null : logo,
    "panner": panner,
    "visitscount": visitscount,
    "rate": rate,
    "offers": List<dynamic>.from(offers.map((x) => x.toJson())),
    "images": List<dynamic>.from(images.map((x) => x.toJson())),
    "admin": admin == null ? null : admin.toJson(),
    "branches": List<dynamic>.from(branches.map((x) => x.toJson())),
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
  String mobile2;
  dynamic pic;
  dynamic latitude;
  dynamic longitude;
  int status;
  dynamic emailVerifiedAt;
  DateTime createdAt;
  DateTime updatedAt;
  dynamic code;
  dynamic codeExp;
  dynamic path;
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

class Branch {
  Branch({
    this.id,
    this.marketId,
    this.latitude,
    this.longitude,
    this.location,
    this.branchRate,
    this.createdAt,
    this.updatedAt,
  });

  int id;
  int marketId;
  String latitude;
  String longitude;
  String location;
  int branchRate;
  DateTime createdAt;
  DateTime updatedAt;

  factory Branch.fromJson(Map<String, dynamic> json) => Branch(
    id: json["id"],
    marketId: json["market_id"],
    latitude: json["latitude"],
    longitude: json["longitude"],
    location: json["location"],
    branchRate: json["branch_rate"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "market_id": marketId,
    "latitude": latitude,
    "longitude": longitude,
    "location": location,
    "branch_rate": branchRate,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
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
    periority: json["periority"] == null ? null : json["periority"],
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
    "periority": periority == null ? null : periority,
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
    this.percentage,
    this.value,
    this.endDate,
    this.management,
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
  String percentage;
  String value;
  DateTime endDate;
  int management;
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
    percentage: json["percentage"],
    value: json["value"],
    endDate: DateTime.parse(json["end_date"]),
    management: json["management"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    deletedAt: json["deleted_at"],
    order: json["order"],
    path: json["path"] == null ? null : json["path"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "market_id": marketId,
    "code": code,
    "pic": pic,
    "percentage": percentage,
    "value": value,
    "end_date": "${endDate.year.toString().padLeft(4, '0')}-${endDate.month.toString().padLeft(2, '0')}-${endDate.day.toString().padLeft(2, '0')}",
    "management": management,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
    "deleted_at": deletedAt,
    "order": order,
    "path": path == null ? null : path,
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