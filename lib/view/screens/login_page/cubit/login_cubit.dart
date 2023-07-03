import 'package:flutter_bloc/flutter_bloc.dart';

import 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  String userNameFake = 'Ayoub004';
  String userPasswordFake = 'Ayoub0041';
  LoginCubit() : super(LoginInitial());

  void authenticateUser(String userName, String userPassword) {
    emit(LoginLoading());
    Future.delayed(const Duration(seconds: 1), (() {
      if (userName == userNameFake && userPassword == userPasswordFake) {
        Future.delayed(
          const Duration(seconds: 1),
          () {
            emit(LoginDone());
          },
        );
      } else {
        emit(LoginFailed());
      }
    }));
  }
}
