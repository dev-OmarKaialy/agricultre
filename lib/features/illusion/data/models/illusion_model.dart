// To parse this JSON data, do
//
//     final pestsResponseModel = pestsResponseModelFromJson(jsonString);

import 'dart:convert';

IllusionResponseModel illusionResponseModelFromJson(String str) =>
    IllusionResponseModel.fromJson(json.decode(str));

String pestsResponseModelToJson(IllusionResponseModel data) =>
    json.encode(data.toJson());

class IllusionResponseModel {
  final String? status;
  final int? results;
  final List<IllusionModel>? doc;

  IllusionResponseModel({
    this.status,
    this.results,
    this.doc,
  });

  factory IllusionResponseModel.fromJson(Map<String, dynamic> json) =>
      IllusionResponseModel(
        status: json["status"],
        results: json["results"],
        doc: json["doc"] == null
            ? []
            : List<IllusionModel>.from(
                json["doc"]!.map((x) => IllusionModel.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "results": results,
        "doc":
            doc == null ? [] : List<dynamic>.from(doc!.map((x) => x.toJson())),
      };
}

class IllusionModel {
  final String? id;
  final String? name;
  final String? symptomsOfInjury;
  final String? photo;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  IllusionModel({
    this.id,
    this.name,
    this.symptomsOfInjury,
    this.photo,
    this.createdAt,
    this.updatedAt,
  });

  factory IllusionModel.fromJson(Map<String, dynamic> json) => IllusionModel(
        id: json["_id"],
        name: json["name"],
        symptomsOfInjury: json["symptoms_of_injury"],
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
        "symptoms_of_injury": symptomsOfInjury,
        "photo": photo,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
      };
}
