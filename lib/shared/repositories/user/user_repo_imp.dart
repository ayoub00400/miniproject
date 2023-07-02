import 'dart:convert';

import 'package:http/http.dart' as http ;
import 'package:mini_project_app/models/user.dart';

import 'package:mini_project_app/shared/repositories/user/user_repo.dart';


import '../../utils/urls.dart';

class UsersApiImplimentation implements IUserRepository {
  
  @override
    Future <List<UserModel>>  getAllUsers() async  {

    try{
       http.Response response =  await http.get(Uri.parse( Urls.users));

         if(response.statusCode==200){
          List<dynamic> decodedResponse= jsonDecode(response.body);
          List<UserModel> usersList;
         usersList=decodedResponse.map((userData)=>UserModel.fromJson(userData)).toList();
         return usersList;
      }else{
        
          throw Exception('server down');
        
      }
    }catch (e){

          throw Exception(e.toString());
    }
  }
  
  @override
  Future<UserModel> getUserById(int userId) async{
     

     try{
       http.Response response =  await http.get(Uri.parse( Urls.users + '/' +userId.toString()));

         if(response.statusCode==200){
          var decodedResponse= jsonDecode(response.body);
          var userData=decodedResponse;
         userData=UserModel.fromJson(userData);
         return userData;
      }else{
        
          throw Exception('server down');
        
      }
    }catch (e){

          throw Exception(e);
    }






    
  
    
  }
  
  
}
