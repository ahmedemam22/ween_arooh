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
  RateModelResult result;

  factory RateModel.fromJson(Map<String, dynamic> json) => RateModel(
    code: json["code"],
    message: json["message"],
    result: RateModelResult.fromJson(json["result"]),
  );

  Map<String, dynamic> toJson() => {
    "code": code,
    "message": message,
    "result": result.toJson(),
  };
}

class RateModelResult {
  RateModelResult({
    this.result,
    this.count,
  });

  List<ResultElement> result;
  Map<String, int> count;

  factory RateModelResult.fromJson(Map<String, dynamic> json) => RateModelResult(
    result: List<ResultElement>.from(json["result"].map((x) => ResultElement.fromJson(x))),
    count: Map.from(json["count"]).map((k, v) => MapEntry<String, int>(k, v)),
  );

  Map<String, dynamic> toJson() => {
    "result": List<dynamic>.from(result.map((x) => x.toJson())),
    "count": Map.from(count).map((k, v) => MapEntry<String, dynamic>(k, v)),
  };
}

class ResultElement {
  ResultElement({
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

  factory ResultElement.fromJson(Map<String, dynamic> json) => ResultElement(
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
  dynamic latitude;
  dynamic longitude;
  int status;
  dynamic emailVerifiedAt;
  DateTime createdAt;
  DateTime updatedAt;
  dynamic code;
  dynamic codeExp;
  String path;
  String address;
  String name;

  factory User.fromJson(Map<String, dynamic> json) => User(
    id: json["id"],
    fName: json["f_name"],
    lName: json["l_name"],
    mobile: json["mobile"],
    mobile2: json["mobile2"],
    pic: json["pic"] == null ? null : json["pic"],
    latitude: json["latitude"],
    longitude: json["longitude"],
    status: json["status"],
    emailVerifiedAt: json["email_verified_at"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    code: json["code"],
    codeExp: json["codeExp"],
    path: json["path"] == null ? null : json["path"],
    address: json["address"],
    name: json["name"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "f_name": fName,
    "l_name": lName,
    "mobile": mobile,
    "mobile2": mobile2,
    "pic": pic == null ? null : pic,
    "latitude": latitude,
    "longitude": longitude,
    "status": status,
    "email_verified_at": emailVerifiedAt,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
    "code": code,
    "codeExp": codeExp,
    "path": path == null ? null : path,
    "address": address,
    "name": name,
  };
}
