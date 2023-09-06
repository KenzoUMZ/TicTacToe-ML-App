// To parse this JSON data, do
//
//     final loginResponseEntity = loginResponseEntityFromJson(jsonString);

import 'dart:convert';

LoginResponseEntity loginResponseEntityFromJson(String str) =>
    LoginResponseEntity.fromJson(json.decode(str));

String loginResponseEntityToJson(LoginResponseEntity data) =>
    json.encode(data.toJson());

class LoginResponseEntity {
  UserEntity user;
  String? token;

  LoginResponseEntity({
    required this.user,
    required this.token,
  });

  factory LoginResponseEntity.fromJson(Map<String, dynamic> json) =>
      LoginResponseEntity(
        user: UserEntity.fromJson(json['user']),
        token: json['token'],
      );

  Map<String, dynamic> toJson() => {
        'user': user.toJson(),
        'token': token,
      };
}

class UserEntity {
  String? id;
  String? name;
  String? email;
  String? avatar;
  String? createdAt;
  String? updatedAt;

  UserEntity({
    required this.id,
    required this.name,
    required this.email,
    required this.avatar,
    required this.createdAt,
    required this.updatedAt,
  });

  factory UserEntity.fromJson(Map<String, dynamic> json) => UserEntity(
        id: json['_id'],
        name: json['name'],
        email: json['email'],
        avatar: json['avatar'],
        createdAt: json['createdAt'],
        updatedAt: json['updatedAt'],
      );

  Map<String, dynamic> toJson() => {
        '_id': id,
        'name': name,
        'email': email,
        'avatar': avatar,
        'createdAt': createdAt,
        'updatedAt': updatedAt,
      };
}
