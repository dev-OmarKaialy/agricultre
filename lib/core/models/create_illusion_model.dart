// To parse this JSON data, do
//
//     final createIllusionModel = createIllusionModelFromJson(jsonString);

import 'dart:convert';

import 'package:first_app/features/illusion/data/models/illusion_model.dart';

CreateIllusionModel createIllusionModelFromJson(String str) =>
    CreateIllusionModel.fromJson(json.decode(str));

String createIllusionModelToJson(CreateIllusionModel data) =>
    json.encode(data.toJson());

class CreateIllusionModel {
  final String? status;
  final IllusionModel? doc;

  CreateIllusionModel({
    this.status,
    this.doc,
  });

  factory CreateIllusionModel.fromJson(Map<String, dynamic> json) =>
      CreateIllusionModel(
        status: json["status"],
        doc: json["doc"] == null ? null : IllusionModel.fromJson(json["doc"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "doc": doc?.toJson(),
      };
}
