import 'package:lock_doctors/core/erorr/faliure.dart';
import 'package:lock_doctors/core/usecase/usecase.dart';
import 'package:fpdart/src/either.dart';
import '../../data/model/user_model.dart';
import '../repository/auth_repository.dart';

class GetCurrentUser implements UseCase<UserModel, NoParams> {
  final AuthRepository authRepository;

  GetCurrentUser(this.authRepository);
  @override
  Future<Either<Faliure, UserModel>> call(NoParams params) async {
    return await authRepository.getCurrentUserData();
  }
}
