import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart';

import '../../../models/usermodel.dart';
import '../../../shared/remote/homepage/usersapiimplement.dart';
import 'home_state.dart';




class HomeCubit extends Cubit<HomeState> {
  List<dynamic> homePageUsers=[];
  HomeCubit() : super(HomeInitial());
  loadHomePageUsers()async{
    Response response;
    homePageUsers=[];
    emit(LoadingHomePageUsers());
    UsersApiImplimentation().getAllUsers().then((value) {
      response=value;
      homePageUsers=jsonDecode(response.body).map((userData)=>UserModel.fromJson(userData)).toList();
      emit(LoadingHomePageUsersDone());
      
    }).catchError((error){emit(LoadingHomePageUsersFailed());
    });
    

  }

}
