import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
   String userNameFake="Ayoub004"; 
  String userPasswordFake="Ayoub0041"; 
  LoginCubit() : super(LoginInitial());

  authanticateUser(String userName,String userPassword){
    
    emit(LoginLoading());
    Future.delayed(const Duration(seconds: 2) ,(() {
      
    if(userName==userNameFake&&userPassword==userPasswordFake){
      Future.delayed(const Duration(seconds: 5),() {
      emit(LoginDone());
    },);
    }else{
      emit(LoginFailed());
    }}));
    

  }
}
