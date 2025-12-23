class EndPoint {
  static String baseUrl = "http://10.0.2.2:8000/api/";

  static String signIn = "user/login";
  static String signUp = "user/register";
  static String logout = "user/logout";
  static String creatNewApartment = "apartment/create";
  static String getAllApartment = "apartments/allApartment";

  static String getUserDataEndPoint(id) {
    return "user/get-user/$id";
  }
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
  //ترجع ليست
}
