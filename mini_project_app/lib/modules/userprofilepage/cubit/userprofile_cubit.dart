import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:http/http.dart';
import 'package:meta/meta.dart';

import '../../../models/usermodel.dart';
import '../../../shared/remote/homepage/usersapiimplement.dart';

part 'userprofile_state.dart';

class UserprofileCubit extends Cubit<UserprofileState> {
  List<UserModel> userProfileDate=[];
  UserprofileCubit() : super(UserprofileInitial());
  getUserById(int userId){
 Response response;

    emit(LoadingUserPageLoading());
    UsersApiImplimentation().getUserById(userId).then((value) {
      response=value;
      userProfileDate=jsonDecode(response.body).map((userData)=>UserModel.fromJson(userData)).toList();
      emit(LoadingUserPageDone());
      
    }).catchError((error){emit(LoadingUserPageFailed());});





  






    
    
    
  }
}





