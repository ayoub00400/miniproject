

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:meta/meta.dart';

import '../../../models/user.dart';
import '../../../shared/repositories/user/user_repo_imp.dart';

part 'userprofile_state.dart';

class UserprofileCubit extends Cubit<UserprofileState> {
  late UserModel userProfileDate;
  UserprofileCubit() : super(UserprofileInitial());
  getUserById(int userId) {
    

    emit(LoadingUserPageLoading());
    try {
      UsersApiImplimentation().getUserById(userId).then((value) {
        userProfileDate = value;
        emit(LoadingUserPageDone());
      }).catchError((error) {
        emit(LoadingUserPageFailed());
      });
    } on Exception {
      emit(LoadingUserPageFailed());
    }
  }
}
