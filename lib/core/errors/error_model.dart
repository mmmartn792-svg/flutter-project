import 'package:projectq/core/api/end_ponits.dart';

class ErrorModel {
  final String message;

  final Map<String, List<String>> errors;

  ErrorModel({required this.message, required this.errors});

  factory ErrorModel.fromJson(Map<String, dynamic> json) {
    final Map<String, List<String>> parsedErrors = {};
    if (json[ApiKey.errors] is Map<String, dynamic>) {
      final errorsJson = json[ApiKey.errors] as Map<String, dynamic>;
      errorsJson.forEach((key, value) {
        if (value is List) {
          parsedErrors[key] = List<String>.from(value);
        }
      });
    }

    return ErrorModel(
      message: json['message'] ?? 'حدث خطأ ما.',

      errors: parsedErrors,
    );
  }

  String getAllErrorsAsString() {
    final allErrors = errors.values.expand((list) => list).join('\n');

    return allErrors.isNotEmpty ? allErrors : message;
  }

  String? getFirstErrorForField(String fieldName) {
    if (errors.containsKey(fieldName)) {
      final fieldErrors = errors[fieldName];
      if (fieldErrors != null && fieldErrors.isNotEmpty) {
        return fieldErrors.first;
      }
    }
    return null;
  }

  @override
  String toString() {
    return 'ErrorModel(message: $message,  errors: $errors)';
  }
}

class ServerException implements Exception {
  final ErrorModel errModel;
  ServerException({required this.errModel});
}
