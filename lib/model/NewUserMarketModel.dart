
class NewUserMarketModel {
  NewUserMarketModel({
    this.code,
    this.message,
    this.result,
  });

  int code;
  String message;
  List<NewUserMarketModelResult> result;

  factory NewUserMarketModel.fromJson(Map<String, dynamic> json) => NewUserMarketModel(
    code: json["code"],
    message: json["message"],
    result: List<NewUserMarketModelResult>.from(json["result"].map((x) => NewUserMarketModelResult.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "code": code,
    "message": message,
    "result": List<dynamic>.from(result.map((x) => x.toJson())),
  };
}

class NewUserMarketModelResult {
  NewUserMarketModelResult({
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
    this.admin,
    this.branches,
    this.recomendations,
    this.category,
  });

  int id;
  String titleAr;
  dynamic titleEn;
  dynamic minDecAr;
  dynamic minDecEn;
  dynamic decAr;
  dynamic decEn;
  double latitude;
  double longitude;
  dynamic siteLink;
  dynamic email;
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
  dynamic minDec;
  dynamic dec;
  String logo;
  String panner;
  int visitscount;
  int rate;
  List<Images> images;
  List<dynamic> offers;
  Admin admin;
  List<dynamic> branches;
  List<dynamic> recomendations;
  Category category;

  factory NewUserMarketModelResult.fromJson(Map<String, dynamic> json) => NewUserMarketModelResult(
    id: json["id"],
    titleAr: (json["title_ar"]!=null)?json["title_ar"]:"",
    titleEn: json["title_en"],
    minDecAr: (json["min_dec_ar"]!=null)?json["min_dec_ar"]:"",
    minDecEn: json["min_dec_en"],
    decAr: (json["dec_ar"]!=null)?json["dec_ar"]:"",
    decEn: json["dec_en"],
    latitude: (json["latitude"]as num).toDouble(),
    longitude: (json["longitude"]as num).toDouble(),
    siteLink: (json["site_link"]!= null)?json["site_link"]:"",
    email: (json["email"]!=null)?json["email"]:"",
    facebook: (json["facebook"]!=null)?json["facebook"]:"",
    youtube: (json["youtube"]!=null)?json["youtube"]:"",
    twitter: (json["twitter"]!=null)?json["twitter"]:"",
    linkedin: (json["linkedin"]!=null)?json["linkedin"]:"",
    parentId: json["parent_id"],
    categoryId: json["category_id"],
    adminId: json["admin_id"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    deletedAt: json["deleted_at"],
    isManagement: json["is_management"],
    mobile: (json["mobile"]!=null)?json["mobile"]:"",
    location: (json["location"]!=null)?json["location"]:"",
    cityId: json["city_id"],
    regionId: json["region_id"],
    title: json["title"],
    minDec: (json["min_dec"]!=null)?json["min_dec"]:"",
    dec: json["dec"],
    logo: json["logo"],
    panner: json["panner"],
    visitscount: json["visitscount"],
    rate: json["rate"],
    images: List<Images>.from(json["images"].map((x) => Images.fromJson(x))),
    offers: List<dynamic>.from(json["offers"].map((x) => x)),
    admin: Admin.fromJson(json["admin"]),
    branches: List<dynamic>.from(json["branches"].map((x) => x)),
    recomendations: List<dynamic>.from(json["recomendations"].map((x) => x)),
    category: Category.fromJson(json["category"]),
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
    "images": List<dynamic>.from(images.map((x) => x.toJson())),
    "offers": List<dynamic>.from(offers.map((x) => x)),
    "admin": admin.toJson(),
    "branches": List<dynamic>.from(branches.map((x) => x)),
    "recomendations": List<dynamic>.from(recomendations.map((x) => x)),
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
    nameAr: (json["name_ar"]!=null)?json["name_ar"]:"",
    nameEn: (json["name_en"]!=null)?json["name_en"]:"",
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

class Images {
  Images({
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

  factory Images.fromJson(Map<String, dynamic> json) => Images(
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
