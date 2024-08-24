import 'package:fpdart/fpdart.dart';
import 'package:lock_doctors/core/erorr/faliure.dart';

import '../../features/doctor_materials/data/model/materials_model.dart';

// Define a utility function to handle exceptions and return an Either type
Future<Either<Faliure, T>> executeTryAndCatch<T>(
    Future<T> Function() action) async {
  try {
    // Try to execute the passed-in function
    return right(await action());
  } catch (e) {
    // Catch and return a Failure if an exception occurs
    return left(Faliure(e.toString()));
  }
}
