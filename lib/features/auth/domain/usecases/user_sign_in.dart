import 'package:lock_doctors/core/common/entities/response.dart';
import 'package:lock_doctors/core/erorr/faliure.dart';
import 'package:lock_doctors/core/usecase/usecase.dart';
import 'package:lock_doctors/features/auth/domain/repository/auth_repository.dart';
// ignore: implementation_imports
import 'package:fpdart/src/either.dart';

class UserSignIn implements UseCase<HostResponse, UserSignInParams> {
  final AuthRepository authRepository;

  UserSignIn(this.authRepository);

  @override
  Future<Either<Faliure, HostResponse>> call(
      UserSignInParams UserSignInParams) async {
    return await authRepository.loginInWithEmailAndPassword(
      email: UserSignInParams.email,
      password: UserSignInParams.password,
    );
  }
}

class UserSignInParams {
  final String email;
  final String password;

  UserSignInParams(
    this.email,
    this.password,
  );
}
