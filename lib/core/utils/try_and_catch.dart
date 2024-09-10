import 'package:fpdart/fpdart.dart';
import 'package:lock_doctors/core/erorr/faliure.dart';

import '../erorr/exception.dart';

// Define a utility function to handle exceptions and return an Either type
Future<Either<Faliure, T>> executeTryAndCatchForRepository<T>(
    Future<T> Function() action) async {
  try {
    return right(await action());
  } catch (e) {
    return left(Faliure(e.toString()));
  }
}

Future<Map> executeTryAndCatchForDataLayer(
    Future<Map> Function() action) async {
  try {
    return await action();
  } catch (e) {
    throw ServerException(message: e.toString());
  }
}
