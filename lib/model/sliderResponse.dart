// To parse this JSON data, do
//
//     final slidersResponse = slidersResponseFromJson(jsonString);

import 'dart:convert';

SlidersResponse slidersResponseFromJson(String str) => SlidersResponse.fromJson(json.decode(str));

String slidersResponseToJson(SlidersResponse data) => json.encode(data.toJson());

class SlidersResponse {
  SlidersResponse({
    this.code,
    this.message,
    this.result,
  });

  int code;
  String message;
  List<Images> result;

  factory SlidersResponse.fromJson(Map<String, dynamic> json) => SlidersResponse(
    code: json["code"],
    message: json["message"],
    result: List<Images>.from(json["result"].map((x) => Images.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "code": code,
    "message": message,
    "result": List<dynamic>.from(result.map((x) => x.toJson())),
  };
}

class Images {
  Images({
    this.id,
    this.image,
    this.order,
    this.createdAt,
    this.updatedAt,
    this.path,
  });

  int id;
  String image;
  int order;
  DateTime createdAt;
  DateTime updatedAt;
  String path;

  factory Images.fromJson(Map<String, dynamic> json) => Images(
    id: json["id"],
    image: json["image"],
    order: json["order"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    path: json["path"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "image": image,
    "order": order,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
    "path": path,
  };
}
