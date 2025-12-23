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
  final List<ApartmentModel> apartments; // <-- تغيير هام

  GetAllApartmentSuccess({required this.apartments});
}

final class GetAllApartmentFailure extends UserState {
  final String errorMessage;

  GetAllApartmentFailure({required this.errorMessage});
}
