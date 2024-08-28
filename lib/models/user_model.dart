// To parse this JSON data, do
//
//     final userModel = userModelFromJson(jsonString);

import 'dart:convert';

UserModel userModelFromJson(String str) => UserModel.fromJson(json.decode(str));

String userModelToJson(UserModel data) => json.encode(data.toJson());

class UserModel {
    String id;
    String userName;
    DateTime createdAt;
    DateTime updatedAt;

    UserModel({
        required this.id,
        required this.userName,
        required this.createdAt,
        required this.updatedAt,
    });

    factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        id: json["_id"],
        userName: json["user_name"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "user_name": userName,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
    };
}
