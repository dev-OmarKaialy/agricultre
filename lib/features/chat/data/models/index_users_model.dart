// To parse this JSON data, do
//
//     final indexUsersModel = indexUsersModelFromJson(jsonString);

import 'dart:convert';

import '../../../auth/data/models/auth_model.dart';

IndexUsersModel indexUsersModelFromJson(String str) =>
    IndexUsersModel.fromJson(json.decode(str));

String indexUsersModelToJson(IndexUsersModel data) =>
    json.encode(data.toJson());

class IndexUsersModel {
  final String? status;
  final int? results;
  final List<UserModel>? doc;

  IndexUsersModel({
    this.status,
    this.results,
    this.doc,
  });

  factory IndexUsersModel.fromJson(Map<String, dynamic> json) =>
      IndexUsersModel(
        status: json["status"],
        results: json["results"],
        doc: json["doc"] == null
            ? []
            : List<UserModel>.from(
                json["doc"]!.map((x) => UserModel.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "results": results,
        "doc":
            doc == null ? [] : List<dynamic>.from(doc!.map((x) => x.toJson())),
      };
}
