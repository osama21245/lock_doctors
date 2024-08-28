import 'package:fpdart/src/either.dart';
import 'package:lock_doctors/features/home/domain/entity/semesters.dart';

import '../../../../core/erorr/faliure.dart';
import '../../../../core/usecase/usecase.dart';
import '../repository/home_repository.dart';

class GetSemesters implements UseCase<List<Semesters>, NoParams> {
  HomeRepository homeRepository;
  GetSemesters(this.homeRepository);

  @override
  Future<Either<Faliure, List<Semesters>>> call(NoParams params) async {
    return await homeRepository.getSemesters();
  }
}
