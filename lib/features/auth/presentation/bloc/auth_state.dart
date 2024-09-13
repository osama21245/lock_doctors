part of 'auth_bloc.dart';

@immutable
sealed class AuthState {}

final class AuthInitial extends AuthState {}

final class AuthLoading extends AuthState {}

final class AuthSetModelSuccess extends AuthState {}

final class AuthSuccess extends AuthState {
  final UserModel userModel;

  AuthSuccess(this.userModel);
}

final class AuthFail extends AuthState {
  final String message;

  AuthFail(this.message);
}

final class AuthGetUserDataFromLocalStorageSuccess extends AuthState {
  final UserModel userModel;

  AuthGetUserDataFromLocalStorageSuccess({required this.userModel});
}

final class AuthSetUserDataToLocalStorageSuccess extends AuthState {
  AuthSetUserDataToLocalStorageSuccess();
}
