import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'dart:convert';
import '../../../models/usermodel.dart';
import '../../../shared/remote/homepage/usersapiimplement.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  List<dynamic> homePageUsers=[];
  HomeCubit() : super(HomeInitial());
  loadHomePageUsers()async{
    var response;
    homePageUsers=[];
    emit(LoadingHomePageUsers());
    UsersApiImplimentation().getAllUsers().then((value) {
      response=value;
      homePageUsers=jsonDecode(response.body).map((userData)=>UserModel.fromJson(userData)).toList();
      emit(LoadingHomePageUsersDone());
      
    }).catchError((error){emit(LoadingHomePageUsersFailed());
    print(error.toString());});
    

  }

}
