// To parse this JSON data, do
//
//     final adviceResponseModel = adviceResponseModelFromJson(jsonString);

import 'dart:convert';

AdviceResponseModel adviceResponseModelFromJson(String str) =>
    AdviceResponseModel.fromJson(json.decode(str));

String adviceResponseModelToJson(AdviceResponseModel data) =>
    json.encode(data.toJson());

class AdviceResponseModel {
  final String? status;
  final int? results;
  final List<AdviceModel>? doc;

  AdviceResponseModel({
    this.status,
    this.results,
    this.doc,
  });

  factory AdviceResponseModel.fromJson(Map<String, dynamic> json) =>
      AdviceResponseModel(
        status: json["status"],
        results: json["results"],
        doc: json["doc"] == null
            ? []
            : List<AdviceModel>.from(
                json["doc"]!.map((x) => AdviceModel.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "results": results,
        "doc":
            doc == null ? [] : List<dynamic>.from(doc!.map((x) => x.toJson())),
      };
}

class AdviceModel {
  final String? id;
  final String? description;
  final String? typeOfClassify;
  final User? user;
  final bool? active;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  AdviceModel({
    this.id,
    this.description,
    this.typeOfClassify,
    this.user,
    this.active,
    this.createdAt,
    this.updatedAt,
  });

  factory AdviceModel.fromJson(Map<String, dynamic> json) => AdviceModel(
        id: json["_id"],
        description: json["description"] ?? '',
        typeOfClassify: json["type_of_classify"] ?? '',
        user: json["user"] == null ? null : User.fromJson(json["user"]),
        active: json["active"],
        createdAt: json["createdAt"] == null
            ? null
            : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null
            ? null
            : DateTime.parse(json["updatedAt"]),
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "description": description,
        "type_of_classify": typeOfClassify,
        "user": user?.toJson(),
        "active": active,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
      };
}

class User {
  final String? id;
  final String? name;
  final String? role;

  User({
    this.id,
    this.name,
    this.role,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["_id"],
        name: json["name"],
        role: json["role"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "name": name,
        "role": role,
      };
}
