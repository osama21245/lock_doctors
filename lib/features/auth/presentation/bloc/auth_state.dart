part of 'auth_bloc.dart';

@immutable
sealed class AuthState {}

final class AuthInitial extends AuthState {}

final class AuthLoading extends AuthState {}

final class AuthSetModelSuccess extends AuthState {}

final class AuthSuccess extends AuthState {
  final String response;

  AuthSuccess(this.response);
}

final class AuthFail extends AuthState {
  final String message;

  AuthFail(this.message);
}
