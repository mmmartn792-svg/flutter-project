import 'package:projectq/core/api/end_ponits.dart';

class Rating {
  final String user;
  final String rating;
  final String comment;

  Rating({required this.user, required this.rating, required this.comment});

  factory Rating.fromJson(Map<String, dynamic> json) {
    return Rating(
      user: json[ApiKey.user],
      rating: json[ApiKey.rating],
      comment: json[ApiKey.comment],
    );
  }
}

class ShowRatingResponse {
  final bool success;
  final String message;
  final List<Rating> data;

  ShowRatingResponse({
    required this.success,
    required this.message,
    required this.data,
  });

  factory ShowRatingResponse.fromJson(Map<String, dynamic> json) {
    var dataList = (json[ApiKey.data] as List<dynamic>)
        .map((item) => Rating.fromJson(item as Map<String, dynamic>))
        .toList();

    return ShowRatingResponse(
      success: json[ApiKey.success],
      message: json[ApiKey.message],
      data: dataList,
    );
  }
}
