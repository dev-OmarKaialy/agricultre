// To parse this JSON data, do
//
//     final indexTypeOfClassifyModel = indexTypeOfClassifyModelFromJson(jsonString);

import 'dart:convert';

IndexTypeOfClassifyModel indexTypeOfClassifyModelFromJson(String str) =>
    IndexTypeOfClassifyModel.fromJson(json.decode(str));

String indexTypeOfClassifyModelToJson(IndexTypeOfClassifyModel data) =>
    json.encode(data.toJson());

class IndexTypeOfClassifyModel {
  final String? status;
  final int? results;
  final List<TypeOfClassify>? doc;

  IndexTypeOfClassifyModel({
    this.status,
    this.results,
    this.doc,
  });

  factory IndexTypeOfClassifyModel.fromJson(Map<String, dynamic> json) =>
      IndexTypeOfClassifyModel(
        status: json["status"],
        results: json["results"],
        doc: json["doc"] == null
            ? []
            : List<TypeOfClassify>.from(
                json["doc"]!.map((x) => TypeOfClassify.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "results": results,
        "doc":
            doc == null ? [] : List<dynamic>.from(doc!.map((x) => x.toJson())),
      };
}

class TypeOfClassify {
  final String? id;
  final String? name;
  final String? plantingDate;
  final String? irrigation;
  final String? reepMethod;
  final String? photo;
  final String? discription;
  final List<dynamic>? care;
  final List<dynamic>? pests;
  final String? storageMethod;
  final List<String>? nutritionalValue;
  final List<String>? plantVarieties;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  TypeOfClassify({
    this.id,
    this.name,
    this.plantingDate,
    this.irrigation,
    this.reepMethod,
    this.photo,
    this.discription,
    this.care,
    this.pests,
    this.storageMethod,
    this.nutritionalValue,
    this.plantVarieties,
    this.createdAt,
    this.updatedAt,
  });

  factory TypeOfClassify.fromJson(Map<String, dynamic> json) => TypeOfClassify(
        id: json["_id"],
        name: json["name"],
        plantingDate: json["planting_date"],
        irrigation: json["irrigation"],
        reepMethod: json["reep_method"],
        photo: json["photo"],
        discription: json["discription"],
        care: json["care"] == null
            ? []
            : List<dynamic>.from(json["care"]!.map((x) => x)),
        pests: json["pests"] == null
            ? []
            : List<dynamic>.from(json["pests"]!.map((x) => x)),
        storageMethod: json["storage_method"],
        nutritionalValue: json["nutritional_value"] == null
            ? []
            : List<String>.from(json["nutritional_value"]!.map((x) => x)),
        plantVarieties: json["plant_varieties"] == null
            ? []
            : List<String>.from(json["plant_varieties"]!.map((x) => x)),
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
        "planting_date": plantingDate,
        "irrigation": irrigation,
        "reep_method": reepMethod,
        "photo": photo,
        "discription": discription,
        "care": care == null ? [] : List<dynamic>.from(care!.map((x) => x)),
        "pests": pests == null ? [] : List<dynamic>.from(pests!.map((x) => x)),
        "storage_method": storageMethod,
        "nutritional_value": nutritionalValue == null
            ? []
            : List<dynamic>.from(nutritionalValue!.map((x) => x)),
        "plant_varieties": plantVarieties == null
            ? []
            : List<dynamic>.from(plantVarieties!.map((x) => x)),
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
      };
}
