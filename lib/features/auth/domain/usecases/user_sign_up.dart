import 'package:lock_doctors/core/erorr/faliure.dart';
import 'package:lock_doctors/core/usecase/usecase.dart';
import 'package:lock_doctors/features/auth/domain/repository/auth_repository.dart';
import 'package:fpdart/src/either.dart';

import '../../../../core/common/entities/response.dart';

class UserSignUp implements UseCase<HostResponse, UserSignUpParams> {
  final AuthRepository authRepository;

  UserSignUp(this.authRepository);

  @override
  Future<Either<Faliure, HostResponse>> call(
      UserSignUpParams userSignUpParams) async {
    return await authRepository.signupWithEmailAndPassword(
        email: userSignUpParams.email,
        password: userSignUpParams.password,
        name: userSignUpParams.name);
  }
}

class UserSignUpParams {
  final String email;
  final String password;
  final String name;

  UserSignUpParams(this.email, this.password, this.name);
}
