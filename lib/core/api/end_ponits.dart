class EndPoint {
  static String baseUrl = "http://10.0.2.2:8000/api/";

  static String signIn = "user/login";
  static String signUp = "user/register";
  static String logout = "user/logout";
  static String creatNewApartment = "apartment/create";
  static String getAllApartment = "apartments/allApartment";
  static String searchFilter = "apartments/searhByFilters";
  static String bookingApartment = "apartment/booking";
  static String AllrenterBookings = "apartment/renterBookings";
  static String cancelBoking = "apartment/cancelBooking";

  static String ApproveOwner = "book/approveBooking";
  static String ApproveOwnermodify = "book/approved";
  static String reject = "book/reject";
  static String modifybooking = "apartment/modifyBooking";
  static String notificationAll = "notification";
  static String notificationNotRead = "notification/notRead";
  static String addRating = "apartment/addRating";
  static String showRating = "apartment/ratings";
  static String favoritesAdd = "favorites/toggle";
  static String favorites = "favorites";
}

class ApiKey {
  static String status = "status";
  static String errorMessage = "ErrorMessage";
  static String secondName = "lastName";
  static String password = "password";
  static String token = "token";
  static String message = "message";
  static String id = "id";
  static String firstName = "firstName";
  static String phone = "phone";
  static String confirmPassword = "password_confirmation";
  static String date = "dateOfBirth";
  static String filePicpersonal = "personalPhoto";
  static String filePicID = "IDPhoto";
  static String role = "role";
  static String createdAt = "created_at";
  static String updatedAt = "updated_at";
  static String errors = "errors";
  //Add Apatment
  static String title = "title";
  static String description = "description";
  static String city_id = "city_id";
  static String area = "area";
  static String price = "price";
  static String rent_type = "rent_type";
  static String categoryOfRentType = "CategoryOfRentType";

  static String floor = "floor";
  static String price_type = "price_type";
  static String amenities = "amenities[]"; //ترجع ليست
  static String phones = "phones[]";
  static String photoOfApartment = "photoOfTheApartment";
  static String province = "province";
  static String city = "city";
  static String rooms_number = "rooms_number";
  static String amenities1 = "amenities";
  static String phones1 = "phones";
  static String personalPhoto = "personalPhoto";
  static String apartment_id = "apartment_id";
  static String start_date = "start_date";
  static String end_date = "end_date";
  static String success = "success";
  static String name_user = "name_user";
  static String data = "data";
  static String id_apartment = "id_apartment";
  static String images = "images[]";
  static String phoneOfOwner = "phoneOfOwner";
  static String province_id = "province_id";
  static String price_unit = "price_unit";
  static String area_unit = "area_unit";
  static String reject_reason = "reject_reason";
  static String bookings = "bookings";

  static String user_id = "user_id";
  static String newStartDate = "new_start_date";
  static String newEndDate = "new_end_date";
  static String ModifyStatuse = "modify_status";
  static String name = "name";
  static String dateOfBirth = "dateOfBirth";
  static String IDPhoto = "IDPhoto";
  static String modify_status = "modify_status";
  static String user = "user";
  static String apartment = "apartment";
  static const String rating = "rating";
  static const String comment = "comment";
  static const String bookingId = "booking_id";
  static const String type = "type";

  static const String notifiable_type = "notifiable_type";
  static const String notifiable_id = "notifiable_id";
  static const String read_at = "read_at";
}
