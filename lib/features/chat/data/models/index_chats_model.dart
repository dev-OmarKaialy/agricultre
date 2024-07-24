// To parse this JSON data, do
//
//     final createChatModel = createChatModelFromJson(jsonString);

import 'dart:convert';

CreateChatModel createChatModelFromJson(String str) =>
    CreateChatModel.fromJson(json.decode(str));

String createChatModelToJson(CreateChatModel data) =>
    json.encode(data.toJson());

class CreateChatModel {
  final String? status;
  final ChatModel? data;

  CreateChatModel({
    this.status,
    this.data,
  });

  factory CreateChatModel.fromJson(Map<String, dynamic> json) =>
      CreateChatModel(
        status: json["status"],
        data: json["data"] == null ? null : ChatModel.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "data": data?.toJson(),
      };
}

class Message {
  final String? id;
  final String? chat;
  final String? sender;
  final String? message;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  Message({
    this.id,
    this.chat,
    this.sender,
    this.message,
    this.createdAt,
    this.updatedAt,
  });

  factory Message.fromJson(Map<String, dynamic> json) => Message(
        id: json["_id"],
        chat: json["chat"],
        sender: json["sender"],
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
        "sender": sender,
        "message": message,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
      };
}

IndexChatModel indexChatModelFromJson(String str) =>
    IndexChatModel.fromJson(json.decode(str));

String indexChatModelToJson(IndexChatModel data) => json.encode(data.toJson());

class IndexChatModel {
  final String? status;
  final List<ChatModel>? doc;

  IndexChatModel({
    this.status,
    this.doc,
  });

  factory IndexChatModel.fromJson(Map<String, dynamic> json) => IndexChatModel(
        status: json["status"],
        doc: json["doc"] == null
            ? []
            : List<ChatModel>.from(
                json["doc"]!.map((x) => ChatModel.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "doc":
            doc == null ? [] : List<dynamic>.from(doc!.map((x) => x.toJson())),
      };
}

class ChatModel {
  final String? id;
  final User? user;
  final dynamic message;

  ChatModel({
    this.id,
    this.user,
    this.message,
  });

  factory ChatModel.fromJson(Map<String, dynamic> json) => ChatModel(
        id: json["_id"],
        user: json["user"] == null ? null : User.fromJson(json["user"]),
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "user": user?.toJson(),
        "message": message,
      };
}

class User {
  final String? id;
  final String? name;
  final String? photo;
  final String? role;

  User({
    this.id,
    this.name,
    this.photo,
    this.role,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["_id"],
        name: json["name"],
        photo: json["photo"],
        role: json["role"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "name": name,
        "photo": photo,
        "role": role,
      };
}
