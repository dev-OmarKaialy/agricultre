// To parse this JSON data, do
//
//     final createMessagesResponseModel = createMessagesResponseModelFromJson(jsonString);

import 'dart:convert';

CreateMessagesResponseModel createMessagesResponseModelFromJson(String str) =>
    CreateMessagesResponseModel.fromJson(json.decode(str));

String createMessagesResponseModelToJson(CreateMessagesResponseModel data) =>
    json.encode(data.toJson());

class CreateMessagesResponseModel {
  final String? status;
  final MessagesModel? doc;

  CreateMessagesResponseModel({
    this.status,
    this.doc,
  });

  factory CreateMessagesResponseModel.fromJson(Map<String, dynamic> json) =>
      CreateMessagesResponseModel(
        status: json["status"],
        doc: json["doc"] == null ? null : MessagesModel.fromJson(json["doc"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "doc": doc?.toJson(),
      };
}

GetAllMessagesResponseModel getAllMessagesResponseModelFromJson(String str) =>
    GetAllMessagesResponseModel.fromJson(json.decode(str));

String getAllMessagesResponseModelToJson(GetAllMessagesResponseModel data) =>
    json.encode(data.toJson());

class GetAllMessagesResponseModel {
  final String? status;
  final int? results;
  final List<MessagesModel>? doc;

  GetAllMessagesResponseModel({
    this.status,
    this.results,
    this.doc,
  });

  factory GetAllMessagesResponseModel.fromJson(Map<String, dynamic> json) =>
      GetAllMessagesResponseModel(
        status: json["status"],
        results: json["results"],
        doc: json["doc"] == null
            ? []
            : List<MessagesModel>.from(
                json["doc"]!.map((x) => MessagesModel.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "results": results,
        "doc":
            doc == null ? [] : List<dynamic>.from(doc!.map((x) => x.toJson())),
      };
}

class MessagesModel {
  final String? id;
  final String? chat;
  final Sender? sender;
  final String? message;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  MessagesModel({
    this.id,
    this.chat,
    this.sender,
    this.message,
    this.createdAt,
    this.updatedAt,
  });

  factory MessagesModel.fromJson(Map<String, dynamic> json) => MessagesModel(
        id: json["_id"],
        chat: json["chat"],
        sender: json["sender"] == null ? null : Sender.fromJson(json["sender"]),
        message: json["message"],
        createdAt: json["createdAt"] == null
            ? null
            : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null
            ? null
            : DateTime.parse(json["updatedAt"]),
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "chat": chat,
        "sender": sender?.toJson(),
        "message": message,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
      };
}

class Sender {
  final String? name;
  final String? photo;

  Sender({
    this.name,
    this.photo,
  });

  factory Sender.fromJson(Map<String, dynamic> json) => Sender(
        name: json["name"],
        photo: json["photo"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "photo": photo,
      };
}
