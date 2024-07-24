// To parse this JSON data, do
//
//     final updateProfileResponseModel = updateProfileResponseModelFromJson(jsonString);

import 'dart:convert';

import 'package:first_app/features/auth/data/models/auth_model.dart';

UpdateProfileResponseModel updateProfileResponseModelFromJson(String str) =>
    UpdateProfileResponseModel.fromJson(json.decode(str));

String updateProfileResponseModelToJson(UpdateProfileResponseModel data) =>
    json.encode(data.toJson());
// To parse this JSON data, do
//
//     final getProfileModel = getProfileModelFromJson(jsonString);

GetProfileModel getProfileModelFromJson(String str) =>
    GetProfileModel.fromJson(json.decode(str));

String getProfileModelToJson(GetProfileModel data) =>
    json.encode(data.toJson());

class GetProfileModel {
  final String? status;
  final UserModel? doc;

  GetProfileModel({
    this.status,
    this.doc,
  });

  factory GetProfileModel.fromJson(Map<String, dynamic> json) =>
      GetProfileModel(
        status: json["status"],
        doc: json["doc"] == null ? null : UserModel.fromJson(json["doc"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "doc": doc?.toJson(),
      };
}

class UpdateProfileResponseModel {
  final String? status;
  final Data? data;

  UpdateProfileResponseModel({
    this.status,
    this.data,
  });

  factory UpdateProfileResponseModel.fromJson(Map<String, dynamic> json) =>
      UpdateProfileResponseModel(
        status: json["status"],
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "data": data?.toJson(),
      };
}

class Data {
  final UserModel? user;

  Data({
    this.user,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        user: json["user"] == null ? null : UserModel.fromJson(json["user"]),
      );

  Map<String, dynamic> toJson() => {
        "user": user?.toJson(),
      };
}
