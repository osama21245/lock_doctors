import 'package:lock_doctors/core/erorr/faliure.dart';
import 'package:lock_doctors/core/usecase/usecase.dart';
import 'package:fpdart/src/either.dart';
import 'package:lock_doctors/features/auth/data/model/user_model.dart';
import '../repository/auth_repository.dart';

class SetCurrentUserToLocalStorage
    implements UseCase<void, SetCurrentUserToLocalStorageParams> {
  final AuthRepository authRepository;

  SetCurrentUserToLocalStorage(this.authRepository);
  @override
  Future<Either<Faliure, void>> call(
      SetCurrentUserToLocalStorageParams params) async {
    return await authRepository.setCurrentUserData(userModel: params.user);
  }
}

class SetCurrentUserToLocalStorageParams {
  final UserModel user;

  SetCurrentUserToLocalStorageParams({required this.user});
}
