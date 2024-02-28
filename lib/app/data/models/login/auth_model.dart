// To parse this JSON data, do
//
//     final authResponseModel = authResponseModelFromJson(jsonString);

import 'dart:convert';

AuthResponseModel authResponseModelFromJson(String str) => AuthResponseModel.fromJson(json.decode(str));

String authResponseModelToJson(AuthResponseModel data) => json.encode(data.toJson());

class AuthResponseModel {
    Data data;
    String message;
    bool status;

    AuthResponseModel({
        required this.data,
        required this.message,
        required this.status,
    });

    factory AuthResponseModel.fromJson(Map<String, dynamic> json) => AuthResponseModel(
        data: Data.fromJson(json["data"]),
        message: json["message"],
        status: json["status"],
    );

    Map<String, dynamic> toJson() => {
        "data": data.toJson(),
        "message": message,
        "status": status,
    };
}

class Data {
    String name;
    String role;
    String token;
    String username;

    Data({
        required this.name,
        required this.role,
        required this.token,
        required this.username,
    });

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        name: json["name"],
        role: json["role"],
        token: json["token"],
        username: json["username"],
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "role": role,
        "token": token,
        "username": username,
    };
}