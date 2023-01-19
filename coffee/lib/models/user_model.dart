import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';

UserModel welcomeFromJson(String str) => UserModel.fromJson(json.decode(str));

String welcomeToJson(UserModel data) => json.encode(data.toJson());

class UserModel {
  UserModel({
    required this.userId,
    required this.fcmToken,
    required this.username,
    required this.password,
    required this.confirmPassword,
    required this.email,
  });

  String userId;
  String fcmToken;
  String username;
  String password;
  String confirmPassword;
  String email;

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        userId: json["user_id"],
        fcmToken: json["fcm_tok"],
        username: json["Username"],
        password: json["password"],
        confirmPassword: json["Confirm Password"],
        email: json["Email"],
      );

  factory UserModel.fromFirebaseSnapshot(
          DocumentSnapshot<Map<String, dynamic>> json) =>
      UserModel(
        userId: json["user_id"],
        fcmToken: json["fcm_token"],
        username: json["Username"],
        password: json["password"],
        confirmPassword: json["Confirm Password"],
        email: json["Email"],
      );

  Map<String, dynamic> toJson() => {
        "user_id": userId,
        "fcm_token": fcmToken,
        "Username": username,
        "password": password,
        "Confirm Password": confirmPassword,
        "Email": email,
      };
}
