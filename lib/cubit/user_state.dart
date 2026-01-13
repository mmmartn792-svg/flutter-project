part of 'user_cubit.dart';

@immutable
sealed class UserState {}

final class UserInitial extends UserState {}

final class signupLoading extends UserState {}

final class signupSucces extends UserState {
  final String message;

  signupSucces({required this.message});
}

final class signupFailuer extends UserState {
  final String errorMessage;

  signupFailuer({required this.errorMessage});
}

final class SignInSuccess extends UserState {
  final String message;
  SignInSuccess({required this.message});
}

final class SignInLoading extends UserState {}

final class SignInFailure extends UserState {
  final String errMessage;

  SignInFailure({required this.errMessage});
}

final class LogoutSuccess extends UserState {
  final String message;
  LogoutSuccess({required this.message});
}

final class LogoutLoading extends UserState {}

final class LogoutFailure extends UserState {
  final String errMessage;

  LogoutFailure({required this.errMessage});
}

final class AddApartmentLoading extends UserState {}

final class AddApartmentSuccess extends UserState {
  final String message;

  AddApartmentSuccess({required this.message});
}

final class AddApartmentFailure extends UserState {
  final String errorMessage;

  AddApartmentFailure({required this.errorMessage});
}

final class GetAllApartmentLoading extends UserState {}

final class GetAllApartmentSuccess extends UserState {
  final List<ApartmentModel> apartments;

  GetAllApartmentSuccess({required this.apartments});
}

final class GetAllApartmentFailure extends UserState {
  final String errorMessage;

  GetAllApartmentFailure({required this.errorMessage});
}

final class FilterSuccess extends UserState {
  final ApartmentListResponse apartments;
  FilterSuccess({required this.apartments});
}

final class FilterLoading extends UserState {}

final class FilterFailure extends UserState {
  final String errMessage;

  FilterFailure({required this.errMessage});
}

final class BookingSuccess extends UserState {
  final BookingResponse bookingResponse;

  BookingSuccess({required this.bookingResponse});
}

final class BookingLoading extends UserState {}

final class BookingFailure extends UserState {
  final String errMessage;

  BookingFailure({required this.errMessage});
}

final class AllBookingSuccess extends UserState {
  final RenterBookingsResponse bookingResponse;

  AllBookingSuccess({required this.bookingResponse});
}

final class AllBookingLoading extends UserState {}

final class AllBookingFailure extends UserState {
  final String errMessage;

  AllBookingFailure({required this.errMessage});
}

final class CancelBookingSuccess extends UserState {
  final String message;
  CancelBookingSuccess({required this.message});
}

final class CancelBookingLoading extends UserState {}

final class CancelBookingtFailure extends UserState {
  final String errMessage;

  CancelBookingtFailure({required this.errMessage});
}

final class AllOwnerBookingSuccess extends UserState {
  final OwnerApartmentsResponse bookingResponse;

  AllOwnerBookingSuccess({required this.bookingResponse});
}

final class AllOwnerBookingLoading extends UserState {}

final class AllOwnerBookingFailure extends UserState {
  final String errMessage;

  AllOwnerBookingFailure({required this.errMessage});
}

final class AproveBookingSuccess extends UserState {
  final String message;
  AproveBookingSuccess({required this.message});
}

final class AproveBookingLoading extends UserState {}

final class AprovelBookingtFailure extends UserState {
  final String errMessage;

  AprovelBookingtFailure({required this.errMessage});
}

final class AproveModifySuccess extends UserState {
  final ApproveModificationResponse modifiedBookingDetails;
  AproveModifySuccess({required this.modifiedBookingDetails});
}

final class AproveModifyLoading extends UserState {}

final class AproveModifyFailure extends UserState {
  final String errMessage;

  AproveModifyFailure({required this.errMessage});
}

final class rejectSuccess extends UserState {
  final ApproveModificationResponse modifiedBookingDetails;
  rejectSuccess({required this.modifiedBookingDetails});
}

final class rejectLoading extends UserState {}

final class rejectFailure extends UserState {
  final String errMessage;

  rejectFailure({required this.errMessage});
}

final class ModifyBookingSuccess extends UserState {
  final BookingResponseModify bookingResponse;

  ModifyBookingSuccess({required this.bookingResponse});
}

final class ModifyBookingLoading extends UserState {}

final class ModifyBookingFailure extends UserState {
  final String errMessage;

  ModifyBookingFailure({required this.errMessage});
}

final class GetAllnotificationloading extends UserState {}

final class GetAllnotificationSuccess extends UserState {
  final NotificationResponse notificationResponse;

  GetAllnotificationSuccess({required this.notificationResponse});
}

final class GetAllnotificationFailure extends UserState {
  final String errorMessage;

  GetAllnotificationFailure({required this.errorMessage});
}

final class GetAllnotificationNotredloading extends UserState {}

final class GetAllnotificationNotreadSuccess extends UserState {
  final NotificationnotreadModel notRead;

  GetAllnotificationNotreadSuccess({required this.notRead});
}

final class GetAllnotificationNotreadFailure extends UserState {
  final String errorMessage;

  GetAllnotificationNotreadFailure({required this.errorMessage});
}

final class NGetAllnotificationNotredloading extends UserState {}

final class NGetAllnotificationNotreadSuccess extends UserState {
  final NotificationResponse notRead;

  NGetAllnotificationNotreadSuccess({required this.notRead});
}

final class NGetAllnotificationNotreadFailure extends UserState {
  final String errorMessage;

  NGetAllnotificationNotreadFailure({required this.errorMessage});
}

final class AddRatingloading extends UserState {}

final class AddRatingSuccess extends UserState {
  final RatingResponse ratingResponse;

  AddRatingSuccess({required this.ratingResponse});
}

final class AddRatingFailure extends UserState {
  final String errorMessage;

  AddRatingFailure({required this.errorMessage});
}

final class ShowRatingloading extends UserState {}

final class ShowRatingSuccess extends UserState {
  final ShowRatingResponse ratingResponse;

  ShowRatingSuccess({required this.ratingResponse});
}

final class ShowRatingFailure extends UserState {
  final String errorMessage;

  ShowRatingFailure({required this.errorMessage});
}

final class Favorirsloading extends UserState {}

final class FavorirsSuccess extends UserState {
  final Favoritesmodel favorit;

  FavorirsSuccess({required this.favorit});
}

final class FavorirsFailure extends UserState {
  final String errorMessage;

  FavorirsFailure({required this.errorMessage});
}

final class GetAllFavoritesLoading extends UserState {}

final class GetAllFavoritestSuccess extends UserState {
  final List<ApartmentModel> apartments; // <-- تغيير هام

  GetAllFavoritestSuccess({required this.apartments});
}

final class GetAllFavoritesFailure extends UserState {
  final String errorMessage;

  GetAllFavoritesFailure({required this.errorMessage});
}

final class isFavorirsloading extends UserState {}

final class isFavorirsSuccess extends UserState {
  final ToggleFavoriteResponse isfavorit;

  isFavorirsSuccess({required this.isfavorit});
}

final class isFavorirsFailure extends UserState {
  final String errorMessage;

  isFavorirsFailure({required this.errorMessage});
}
