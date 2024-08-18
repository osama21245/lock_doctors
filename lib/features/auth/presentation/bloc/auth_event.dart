part of 'auth_bloc.dart';

@immutable
sealed class AuthEvent {}

class AuthSignUp extends AuthEvent {
  final String name;

  AuthSignUp(this.name);
}

class AuthSignIn extends AuthEvent {
  final String email;
  final String password;

  AuthSignIn(
    this.email,
    this.password,
  );
}

class AuthIsUserLoggedIn extends AuthEvent {}

class AuthSetStudFaceModel extends AuthEvent {
  final List<File> image;
  final String studId;

  AuthSetStudFaceModel({required this.image, required this.studId});
}
