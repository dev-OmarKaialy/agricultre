// To parse this JSON data, do
//
//     final advertismnetModel = advertismnetModelFromJson(jsonString);

import 'dart:convert';

AdvertismnetModel advertismnetModelFromJson(String str) =>
    AdvertismnetModel.fromJson(json.decode(str));

String advertismnetModelToJson(AdvertismnetModel data) =>
    json.encode(data.toJson());

class AdvertismnetModel {
  final String? status;
  final int? results;
  final List<AdModel>? doc;

  AdvertismnetModel({
    this.status,
    this.results,
    this.doc,
  });

  factory AdvertismnetModel.fromJson(Map<String, dynamic> json) =>
      AdvertismnetModel(
        status: json["status"],
        results: json["results"],
        doc: json["doc"] == null
            ? []
            : List<AdModel>.from(json["doc"]!.map((x) => AdModel.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "results": results,
        "doc":
            doc == null ? [] : List<dynamic>.from(doc!.map((x) => x.toJson())),
      };
}

class AdModel {
  final String? id;
  final String? name;
  final String? photo;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  AdModel({
    this.id,
    this.name,
    this.photo,
    this.createdAt,
    this.updatedAt,
  });

  factory AdModel.fromJson(Map<String, dynamic> json) => AdModel(
        id: json["_id"],
        name: json["name"],
        photo: json["photo"],
        createdAt: json["createdAt"] == null
            ? null
            : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null
            ? null
            : DateTime.parse(json["updatedAt"]),
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "name": name,
        "photo": photo,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
      };
}
