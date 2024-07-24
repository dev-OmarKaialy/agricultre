// To parse this JSON data, do
//
//     final authResponseModel = authResponseModelFromJson(jsonString);

import 'dart:convert';

AuthResponseModel authResponseModelFromJson(String str) =>
    AuthResponseModel.fromJson(json.decode(str));

String authResponseModelToJson(AuthResponseModel data) =>
    json.encode(data.toJson());

class AuthResponseModel {
  final String? status;
  final String? token;
  final UserModel? user;

  AuthResponseModel({
    this.status,
    this.token,
    this.user,
  });

  factory AuthResponseModel.fromJson(Map<String, dynamic> json) =>
      AuthResponseModel(
        status: json["status"],
        token: json["token"],
        user: json["user"] == null ? null : UserModel.fromJson(json["user"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "token": token,
        "user": user?.toJson(),
      };
}

class UserModel {
  final String? id;
  final String? name;
  final String? email;
  final String? phone;
  final String? photo;
  final String? role;
  final String? address;
  final DateTime? passwordResetExpires;
  final String? passwordResetToken;

  UserModel({
    this.id,
    this.name,
    this.email,
    this.phone,
    this.photo,
    this.role,
    this.address,
    this.passwordResetExpires,
    this.passwordResetToken,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        id: json["_id"],
        name: json["name"],
        email: json["email"],
        phone: json["phone"],
        photo: json["photo"],
        role: json["role"],
        address: json["address"],
        passwordResetExpires: json["passwordResetExpires"] == null
            ? null
            : DateTime.parse(json["passwordResetExpires"]),
        passwordResetToken: json["passwordResetToken"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "name": name,
        "email": email,
        "phone": phone,
        "photo": photo,
        "role": role,
        "address": address,
        "passwordResetExpires": passwordResetExpires?.toIso8601String(),
        "passwordResetToken": passwordResetToken,
      };
}
