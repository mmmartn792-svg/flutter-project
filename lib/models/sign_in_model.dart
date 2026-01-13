import 'package:projectq/core/api/end_ponits.dart';

class SignInModel {
  final bool success;
  final String message;
  final UserData data;

  const SignInModel({
    required this.success,
    required this.message,
    required this.data,
  });

  factory SignInModel.fromJson(Map<String, dynamic> jsonData) {
    return SignInModel(
      message: jsonData[ApiKey.message],
      success: jsonData[ApiKey.success],
      data: UserData.fromJson(jsonData[ApiKey.data]),
    );
  }
}

class UserData {
  final String token;
  final String nameUser;
  final String phone;
  final String role;

  const UserData({
    required this.token,
    required this.nameUser,
    required this.phone,
    required this.role,
  });

  factory UserData.fromJson(Map<String, dynamic> json) {
    return UserData(
      token: json[ApiKey.token],
      nameUser: json[ApiKey.name_user],
      phone: json[ApiKey.phone],
      role: json[ApiKey.role],
    );
  }
}
