import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
   String userNameFake="Ayoub004"; 
  String userPasswordFake="Ayoub0041"; 
  LoginCubit() : super(LoginInitial());

  authanticateUser(String userName,String userPassword){
    print("${userName.toString()} ------- ${userPassword.toString()}");
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
