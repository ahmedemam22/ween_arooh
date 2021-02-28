// To parse this JSON data, do
//
//     final mainCategoryResponse = mainCategoryResponseFromJson(jsonString);

import 'dart:convert';

MainCategoryResponse mainCategoryResponseFromJson(String str) => MainCategoryResponse.fromJson(json.decode(str));

String mainCategoryResponseToJson(MainCategoryResponse data) => json.encode(data.toJson());

class MainCategoryResponse {
  MainCategoryResponse({
    this.code,
    this.message,
    this.result,
  });

  int code;
  String message;
  List<Result> result;

  factory MainCategoryResponse.fromJson(Map<String, dynamic> json) => MainCategoryResponse(
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
    this.nameAr,
    this.nameEn,
    this.logo,
    this.path,
    this.name,
    this.mindesc,
    this.desc,
  });

  int id;
  String nameAr;
  String nameEn;
  String logo;
  String path;
  String name;
  dynamic mindesc;
  dynamic desc;

  factory Result.fromJson(Map<String, dynamic> json) => Result(
    id: json["id"],
    nameAr: json["name_ar"],
    nameEn: json["name_en"],
    logo: json["logo"],
    path: json["path"],
    name: json["name"],
    mindesc: json["mindesc"],
    desc: json["desc"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name_ar": nameAr,
    "name_en": nameEn,
    "logo": logo,
    "path": path,
    "name": name,
    "mindesc": mindesc,
    "desc": desc,
  };
}
