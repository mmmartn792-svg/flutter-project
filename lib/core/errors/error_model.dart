import 'package:projectq/core/api/end_ponits.dart';

class ErrorModel {
  final String message;
  final bool success;
  Map<String, dynamic>? errors;

  ErrorModel({required this.message, required this.success, this.errors});

  factory ErrorModel.fromJson(Map<String, dynamic> json) {
    return ErrorModel(
      message: json[ApiKey.message] ?? 'An unknown error occurred.',
      success: json[ApiKey.success] ?? false,
      errors: json[ApiKey.errors],
    );
  }
}
