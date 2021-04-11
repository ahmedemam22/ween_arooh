
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
  String createdAt;
  String updatedAt;
  String deletedAt;
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
  List<Images> images;
  List<Offers> offers;
  List<Coupons> coupons;
  Admin admin;
  List<Recomendations> recomendations;
  Category category;

  NewUserMarketModelResult(
      {this.id,
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
        this.recomendations,
        this.category});

  NewUserMarketModelResult.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    titleAr = json['title_ar'];
    titleEn = json['title_en'];
    minDecAr = json['min_dec_ar'];
    minDecEn = json['min_dec_en'];
    decAr = json['dec_ar'];
    decEn = json['dec_en'];
    latitude = json['latitude'];
    longitude = json['longitude'];
    siteLink = json['site_link'];
    email = json['email'];
    facebook = json['facebook'];
    youtube = json['youtube'];
    twitter = json['twitter'];
    linkedin = json['linkedin'];
    parentId = json['parent_id'];
    categoryId = json['category_id'];
    adminId = json['admin_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    deletedAt = json['deleted_at'];
    isManagement = json['is_management'];
    mobile = json['mobile'];
    location = json['location'];
    cityId = json['city_id'];
    regionId = json['region_id'];
    title = json['title'];
    minDec = json['min_dec'];
    dec = json['dec'];
    logo = json['logo'];
    panner = json['panner'];
    visitscount = json['visitscount'];
    rate = json['rate'];
    if (json['images'] != null) {
      images = new List<Images>();
      json['images'].forEach((v) {
        images.add(new Images.fromJson(v));
      });
    }
    if (json['offers'] != null) {
      offers = new List<Offers>();
      json['offers'].forEach((v) {
        offers.add(new Offers.fromJson(v));
      });
    }
    if (json['coupons'] != null) {
      coupons = new List<Coupons>();
      json['coupons'].forEach((v) {
        coupons.add(new Coupons.fromJson(v));
      });
    }
    admin = json['admin'] != null ? new Admin.fromJson(json['admin']) : null;

    if (json['recomendations'] != null) {
      recomendations = new List<Recomendations>();
      json['recomendations'].forEach((v) {
        recomendations.add(new Recomendations.fromJson(v));
      });
    }
    category = json['category'] != null
        ? new Category.fromJson(json['category'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title_ar'] = this.titleAr;
    data['title_en'] = this.titleEn;
    data['min_dec_ar'] = this.minDecAr;
    data['min_dec_en'] = this.minDecEn;
    data['dec_ar'] = this.decAr;
    data['dec_en'] = this.decEn;
    data['latitude'] = this.latitude;
    data['longitude'] = this.longitude;
    data['site_link'] = this.siteLink;
    data['email'] = this.email;
    data['facebook'] = this.facebook;
    data['youtube'] = this.youtube;
    data['twitter'] = this.twitter;
    data['linkedin'] = this.linkedin;
    data['parent_id'] = this.parentId;
    data['category_id'] = this.categoryId;
    data['admin_id'] = this.adminId;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['deleted_at'] = this.deletedAt;
    data['is_management'] = this.isManagement;
    data['mobile'] = this.mobile;
    data['location'] = this.location;
    data['city_id'] = this.cityId;
    data['region_id'] = this.regionId;
    data['title'] = this.title;
    data['min_dec'] = this.minDec;
    data['dec'] = this.dec;
    data['logo'] = this.logo;
    data['panner'] = this.panner;
    data['visitscount'] = this.visitscount;
    data['rate'] = this.rate;
    if (this.images != null) {
      data['images'] = this.images.map((v) => v.toJson()).toList();
    }
    if (this.offers != null) {
      data['offers'] = this.offers.map((v) => v.toJson()).toList();
    }
    if (this.coupons != null) {
      data['coupons'] = this.coupons.map((v) => v.toJson()).toList();
    }
    if (this.admin != null) {
      data['admin'] = this.admin.toJson();
    }
    if (this.recomendations != null) {
      data['recomendations'] =
          this.recomendations.map((v) => v.toJson()).toList();
    }
    if (this.category != null) {
      data['category'] = this.category.toJson();
    }
    return data;
  }
}

class Images {
  int id;
  int marketId;
  String name;
  int type;
  int periority;
  String pageLoca;
  String createdAt;
  String updatedAt;
  String deletedAt;
  String path;

  Images(
      {this.id,
        this.marketId,
        this.name,
        this.type,
        this.periority,
        this.pageLoca,
        this.createdAt,
        this.updatedAt,
        this.deletedAt,
        this.path});

  Images.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    marketId = json['market_id'];
    name = json['name'];
    type = json['type'];
    periority = json['periority'];
    pageLoca = json['page_loca'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    deletedAt = json['deleted_at'];
    path = json['path'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['market_id'] = this.marketId;
    data['name'] = this.name;
    data['type'] = this.type;
    data['periority'] = this.periority;
    data['page_loca'] = this.pageLoca;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['deleted_at'] = this.deletedAt;
    data['path'] = this.path;
    return data;
  }
}

class Offers {
  int id;
  int marketId;
  String code;
  String pic;
  String createdAt;
  String updatedAt;
  String deletedAt;
  int order;
  String path;

  Offers(
      {this.id,
        this.marketId,
        this.code,
        this.pic,
        this.createdAt,
        this.updatedAt,
        this.deletedAt,
        this.order,
        this.path});

  Offers.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    marketId = json['market_id'];
    code = json['code'];
    pic = json['pic'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    deletedAt = json['deleted_at'];
    order = json['order'];
    path = json['path'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['market_id'] = this.marketId;
    data['code'] = this.code;
    data['pic'] = this.pic;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['deleted_at'] = this.deletedAt;
    data['order'] = this.order;
    data['path'] = this.path;
    return data;
  }
}

class Coupons {
  int id;
  String image;
  int marketId;
  String createdAt;
  String updatedAt;
  String path;

  Coupons(
      {this.id,
        this.image,
        this.marketId,
        this.createdAt,
        this.updatedAt,
        this.path});

  Coupons.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    image = json['image'];
    marketId = json['market_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    path = json['path'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['image'] = this.image;
    data['market_id'] = this.marketId;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['path'] = this.path;
    return data;
  }
}

class Admin {
  int id;
  String fName;
  String lName;
  String mobile;
  Null mobile2;
  String pic;
  Null latitude;
  Null longitude;
  int status;
  Null emailVerifiedAt;
  String createdAt;
  String updatedAt;
  String code;
  String codeExp;
  String path;
  String address;
  String name;

  Admin(
      {this.id,
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
        this.name});

  Admin.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    fName = json['f_name'];
    lName = json['l_name'];
    mobile = json['mobile'];
    mobile2 = json['mobile2'];
    pic = json['pic'];
    latitude = json['latitude'];
    longitude = json['longitude'];
    status = json['status'];
    emailVerifiedAt = json['email_verified_at'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    code = json['code'];
    codeExp = json['codeExp'];
    path = json['path'];
    address = json['address'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['f_name'] = this.fName;
    data['l_name'] = this.lName;
    data['mobile'] = this.mobile;
    data['mobile2'] = this.mobile2;
    data['pic'] = this.pic;
    data['latitude'] = this.latitude;
    data['longitude'] = this.longitude;
    data['status'] = this.status;
    data['email_verified_at'] = this.emailVerifiedAt;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['code'] = this.code;
    data['codeExp'] = this.codeExp;
    data['path'] = this.path;
    data['address'] = this.address;
    data['name'] = this.name;
    return data;
  }
}

class Recomendations {
  int id;
  int marketId;
  int userId;
  int rate;
  String comment;
  int visitsCount;
  String createdAt;
  String updatedAt;
  Null deletedAt;

  Recomendations(
      {this.id,
        this.marketId,
        this.userId,
        this.rate,
        this.comment,
        this.visitsCount,
        this.createdAt,
        this.updatedAt,
        this.deletedAt});

  Recomendations.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    marketId = json['market_id'];
    userId = json['user_id'];
    rate = json['rate'];
    comment = json['comment'];
    visitsCount = json['visits_count'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    deletedAt = json['deleted_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['market_id'] = this.marketId;
    data['user_id'] = this.userId;
    data['rate'] = this.rate;
    data['comment'] = this.comment;
    data['visits_count'] = this.visitsCount;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['deleted_at'] = this.deletedAt;
    return data;
  }
}

class Category {
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
  Null cost;
  String createdAt;
  String updatedAt;
  String path;
  String name;
  String mindesc;
  String desc;

  Category(
      {this.id,
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
        this.desc});

  Category.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nameAr = json['name_ar'];
    nameEn = json['name_en'];
    minDescEn = json['min_desc_en'];
    minDescAr = json['min_desc_ar'];
    descEn = json['desc_en'];
    descAr = json['desc_ar'];
    logo = json['logo'];
    visitsCount = json['visits_count'];
    parentId = json['parent_id'];
    cost = json['cost'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    path = json['path'];
    name = json['name'];
    mindesc = json['mindesc'];
    desc = json['desc'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name_ar'] = this.nameAr;
    data['name_en'] = this.nameEn;
    data['min_desc_en'] = this.minDescEn;
    data['min_desc_ar'] = this.minDescAr;
    data['desc_en'] = this.descEn;
    data['desc_ar'] = this.descAr;
    data['logo'] = this.logo;
    data['visits_count'] = this.visitsCount;
    data['parent_id'] = this.parentId;
    data['cost'] = this.cost;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['path'] = this.path;
    data['name'] = this.name;
    data['mindesc'] = this.mindesc;
    data['desc'] = this.desc;
    return data;
  }
}