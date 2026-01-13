import 'package:projectq/core/api/end_ponits.dart';

class RatingData {
  final int userId;
  final int bookingId;
  final int rating;
  final String comment;
  final DateTime updatedAt;
  final DateTime createdAt;
  final int id;

  const RatingData({
    required this.userId,
    required this.bookingId,
    required this.rating,
    required this.comment,
    required this.updatedAt,
    required this.createdAt,
    required this.id,
  });

  factory RatingData.fromJson(Map<String, dynamic> json) {
    return RatingData(
      userId: json[ApiKey.user_id],
      bookingId: json[ApiKey.bookingId],
      rating: json[ApiKey.rating],
      comment: json[ApiKey.comment],
      updatedAt: DateTime.parse(json[ApiKey.updatedAt]),
      createdAt: DateTime.parse(json[ApiKey.createdAt]),
      id: json[ApiKey.id],
    );
  }
}

class RatingResponse {
  final bool success;
  final String message;
  final RatingData data;

  const RatingResponse({
    required this.success,
    required this.message,
    required this.data,
  });

  factory RatingResponse.fromJson(Map<String, dynamic> json) {
    return RatingResponse(
      success: json[ApiKey.success],
      message: json[ApiKey.message],
      data: RatingData.fromJson(json[ApiKey.data]),
    );
  }
}
