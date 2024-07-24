// To parse this JSON data, do
//
//     final careResponseModel = careResponseModelFromJson(jsonString);

import 'dart:convert';

CareResponseModel careResponseModelFromJson(String str) =>
    CareResponseModel.fromJson(json.decode(str));

String careResponseModelToJson(CareResponseModel data) =>
    json.encode(data.toJson());

class CareResponseModel {
  final String? status;
  final int? results;
  final List<CareModel>? doc;

  CareResponseModel({
    this.status,
    this.results,
    this.doc,
  });

  factory CareResponseModel.fromJson(Map<String, dynamic> json) =>
      CareResponseModel(
        status: json["status"],
        results: json["results"],
        doc: json["doc"] == null
            ? []
            : List<CareModel>.from(
                json["doc"]!.map((x) => CareModel.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "results": results,
        "doc":
            doc == null ? [] : List<dynamic>.from(doc!.map((x) => x.toJson())),
      };
}

class CareModel {
  final String? id;
  final String? name;
  final String? discrption;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  CareModel({
    this.id,
    this.name,
    this.discrption,
    this.createdAt,
    this.updatedAt,
  });

  factory CareModel.fromJson(Map<String, dynamic> json) => CareModel(
        id: json["_id"],
        name: json["name"],
        discrption: json["discrption"],
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
        "discrption": discrption,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
      };
}
