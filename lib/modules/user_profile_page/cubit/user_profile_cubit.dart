import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../models/user.dart';
import '../../../shared/repositories/user/user_repo_imp.dart';
import 'user_profile_state.dart';

class UserProfileCubit extends Cubit<UserProfileState> {
  late User userProfileDate;
  UserProfileCubit() : super(UserProfileInitial());
  void getUserById(int userId) {
    emit(LoadingUserPageLoading());
    try {
      UserRepository().getUserById(userId).then((value) {
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
