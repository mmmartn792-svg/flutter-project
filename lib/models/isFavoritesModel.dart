// ملف models/favorite_data.dart

// هذا الكلاس يمثل الكائن الداخلي "data"
class FavoriteData {
  final bool isFavorite;

  FavoriteData({required this.isFavorite});

  // دالة لتحليل الـ JSON القادم من الـ API إلى كائن FavoriteData
  factory FavoriteData.fromJson(Map<String, dynamic> json) {
    return FavoriteData(isFavorite: json['is_favorite']);
  }

  // دالة لتحويل كائن FavoriteData إلى JSON (إذا أردت إرساله للخادم)
  Map<String, dynamic> toJson() {
    return {'is_favorite': isFavorite};
  }
}

// هذا الكلاس يمثل الاستجابة الكاملة من الـ API
class ToggleFavoriteResponse {
  final bool success;
  final String message;
  final FavoriteData data;

  ToggleFavoriteResponse({
    required this.success,
    required this.message,
    required this.data,
  });

  // دالة لتحليل الـ JSON الكامل
  factory ToggleFavoriteResponse.fromJson(Map<String, dynamic> json) {
    return ToggleFavoriteResponse(
      success: json['success'],
      message: json['message'],
      // نستخدم fromJson الخاص بـ FavoriteData لتحليل الكائن الداخلي
      data: FavoriteData.fromJson(json['data']),
    );
  }

  // دالة لتحويل الكائن الكامل إلى JSON
  Map<String, dynamic> toJson() {
    return {'success': success, 'message': message, 'data': data.toJson()};
  }
}
