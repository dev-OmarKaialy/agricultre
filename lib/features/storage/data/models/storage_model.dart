// To parse this JSON data, do
//
//     final indexStorageModel = indexStorageModelFromJson(jsonString);

import 'dart:convert';

IndexStorageModel indexStorageModelFromJson(String str) =>
    IndexStorageModel.fromJson(json.decode(str));

String indexStorageModelToJson(IndexStorageModel data) =>
    json.encode(data.toJson());

class IndexStorageModel {
  final String? status;
  final int? results;
  final List<StorageModel>? doc;

  IndexStorageModel({
    this.status,
    this.results,
    this.doc,
  });

  factory IndexStorageModel.fromJson(Map<String, dynamic> json) =>
      IndexStorageModel(
        status: json["status"],
        results: json["results"],
        doc: json["doc"] == null
            ? []
            : List<StorageModel>.from(
                json["doc"]!.map((x) => StorageModel.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "results": results,
        "doc":
            doc == null ? [] : List<dynamic>.from(doc!.map((x) => x.toJson())),
      };
}

class StorageModel {
  final String? id;
  final String? name;
  final String? discrption;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  StorageModel({
    this.id,
    this.name,
    this.discrption,
    this.createdAt,
    this.updatedAt,
  });

  factory StorageModel.fromJson(Map<String, dynamic> json) => StorageModel(
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
