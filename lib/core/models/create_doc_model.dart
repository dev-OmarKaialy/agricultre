// To parse this JSON data, do
//
//     final createDocModel = createDocModelFromJson(jsonString);

import 'dart:convert';

CreateDocModel createDocModelFromJson(String str) =>
    CreateDocModel.fromJson(json.decode(str));

String createDocModelToJson(CreateDocModel data) => json.encode(data.toJson());

class CreateDocModel {
  final String? status;
  final Doc? doc;

  CreateDocModel({
    this.status,
    this.doc,
  });

  factory CreateDocModel.fromJson(Map<String, dynamic> json) => CreateDocModel(
        status: json["status"],
        doc: json["doc"] == null ? null : Doc.fromJson(json["doc"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "doc": doc?.toJson(),
      };
}

class Doc {
  final String? name;
  final String? discrption;
  final String? id;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  Doc({
    this.name,
    this.discrption,
    this.id,
    this.createdAt,
    this.updatedAt,
  });

  factory Doc.fromJson(Map<String, dynamic> json) => Doc(
        name: json["name"],
        discrption: json["discrption"],
        id: json["_id"],
        createdAt: json["createdAt"] == null
            ? null
            : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null
            ? null
            : DateTime.parse(json["updatedAt"]),
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "discrption": discrption,
        "_id": id,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
      };
}
