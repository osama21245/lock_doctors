import 'package:lock_doctors/core/erorr/faliure.dart';
import 'package:lock_doctors/core/usecase/usecase.dart';
import 'package:fpdart/src/either.dart';

import '../../../../core/common/entities/user.dart';
import '../repository/auth_repository.dart';

class GetCurrentUser implements UseCase<User?, NoParams> {
  final AuthRepository authRepository;

  GetCurrentUser(this.authRepository);
  @override
  Future<Either<Faliure, User?>> call(NoParams params) async {
    return await authRepository.getCurrentUserData();
  }
}
