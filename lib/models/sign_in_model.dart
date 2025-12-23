import 'package:projectq/core/api/end_ponits.dart';

class SignInModel {
  final String message;
  final String token;
  final User user; // هنا نستخدم كلاس User الذي أنشأناه

  const SignInModel({
    required this.message,
    required this.token,
    required this.user,
  });

  factory SignInModel.fromJson(Map<String, dynamic> jsonData) {
    return SignInModel(
      message: jsonData[ApiKey.message],
      token: jsonData[ApiKey.token],

      user: User.fromJson(jsonData['user']),
    );
  }
}

class User {
  final int id;
  final String phone;
  final String role;
  final firstName;
  final lastName;
  final String dateOfBirth;
  final String personalPhoto;
  final String IDPhoto;
  final String status;
  final String createdAt;
  final String updatedAt;

  const User({
    required this.id,
    required this.phone,
    required this.role,
    this.firstName,
    this.lastName,
    required this.dateOfBirth,
    required this.personalPhoto,
    required this.IDPhoto,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
  });

  /// دالة لتحويل بيانات JSON (Map) إلى كائن من كلاس User
  factory User.fromJson(Map<String, dynamic> jsonData) {
    return User(
      id: jsonData[ApiKey.id],
      phone: jsonData[ApiKey.phone],
      role: jsonData[ApiKey.role],
      firstName: jsonData[ApiKey.firstName],
      lastName: jsonData[ApiKey.secondName],
      dateOfBirth: jsonData[ApiKey.date],
      personalPhoto: jsonData[ApiKey.filePicpersonal],
      IDPhoto: jsonData[ApiKey.filePicID],
      status: jsonData[ApiKey.status],
      // ملاحظة: في JSON الأسماء هي created_at و updated_at (snake_case)
      // في Dart المعتاد هو camelCase (createdAt و updatedAt)
      // لذلك نقوم بالربط يدوياً هنا
      createdAt: jsonData[ApiKey.createdAt],
      updatedAt: jsonData[ApiKey.updatedAt],
    );
  }
}
