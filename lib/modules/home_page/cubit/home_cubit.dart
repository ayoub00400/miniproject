

import 'package:flutter_bloc/flutter_bloc.dart';


import '../../../models/user.dart';
import '../../../shared/repositories/user/user_repo_imp.dart';
import 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  List<UserModel> homePageUsers = [];
  HomeCubit() : super(HomeInitial());
  loadHomePageUsers() async {
    homePageUsers = [];
    emit(LoadingHomePageUsers());

    try {
      UsersApiImplimentation().getAllUsers().then((value) {
        homePageUsers = value;
        emit(LoadingHomePageUsersDone());
      }).catchError((error) {
      
        emit(LoadingHomePageUsersFailed());
      });

    } on Exception {
      
      emit(LoadingHomePageUsersFailed());

    }
  }
}
