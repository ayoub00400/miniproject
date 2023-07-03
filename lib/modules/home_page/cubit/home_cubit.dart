import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../models/user.dart';
import '../../../shared/repositories/user/user_repo_imp.dart';
import 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  List<User> homePageUsers = [];
  final userRepository = UserRepository();

  HomeCubit() : super(HomeInitial());

  Future<void> loadHomePageUsers() async {
    try {
      homePageUsers = [];
      emit(LoadingHomePageUsers());
      homePageUsers = await userRepository.getAllUsers();
      emit(LoadingHomePageUsersDone());
    } on Exception {
      emit(LoadingHomePageUsersFailed());
    }
  }
}
