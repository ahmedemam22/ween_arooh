// To parse this JSON data, do
//
//     final userModel = userModelFromJson(jsonString);

import 'dart:convert';
import 'dart:io';

UserModel userModelFromJson(String str) => UserModel.fromJson(json.decode(str));

String userModelToJson(UserModel data) => json.encode(data.toJson());

class UserModel {
  UserModel({
    this.code,
    this.message,
    this.result,
  });

  int code;
  String message;
  User result;

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
    code: json["code"],
    message: json["message"],
    result: User.fromJson(json["result"]),
  );

  Map<String, dynamic> toJson() => {
    "code": code,
    "message": message,
    "result": result.toJson(),
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
    this.token,
    this.path,
    this.address,
    this.name,
    this.imgProfile
  });

  int id;
  String fName;
  String lName;
  String mobile;
  dynamic mobile2;
  File imgProfile;
  String pic;
  dynamic latitude;
  dynamic longitude;
  int status;
  dynamic emailVerifiedAt;
  DateTime createdAt;
  DateTime updatedAt;
  String code;
  String codeExp;
  String token;
  dynamic path;
  String address;
  String name;

  factory User.fromJson(Map<String, dynamic> json) => User(
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
    createdAt: json["created_at"]!=null?DateTime.parse(json["created_at"]):null,
    updatedAt: json["updated_at"]!=null?DateTime.parse(json["updated_at"]):null,
    code: json["code"],
    codeExp: json["codeExp"],
    token: json["token"],
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
    "created_at": createdAt?.toIso8601String(),
    "updated_at": updatedAt?.toIso8601String(),
    "code": code,
    "codeExp": codeExp,
    "token": token,
    "path": path,
    "address": address,
    "name": name,
  };
}
