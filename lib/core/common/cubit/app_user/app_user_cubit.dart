import 'package:bloc/bloc.dart';
import 'package:lock_doctors/core/common/entities/user_model.dart';
import 'package:meta/meta.dart';

import '../../entities/user.dart';

part 'app_user_state.dart';

class AppUserCubit extends Cubit<AppUserState> {
  AppUserCubit() : super(AppUserInitial());

  void updateUser(UserModel? user) {
    if (user != null) {
      emit(AppUserIsLogIn(user: user));
    }
  }
}
