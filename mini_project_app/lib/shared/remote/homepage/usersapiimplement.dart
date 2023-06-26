
import 'package:http/http.dart';

import 'package:mini_project_app/shared/remote/homepage/usersapi.dart';

class UsersApiImplimentation implements UsersApi {
    final String apiPath="https://fakestoreapi.com/users";
  @override
   Future<Response> getAllUsers() async {
    return await get(Uri.parse(apiPath));
  }
  
  @override
  Future<Response> getUserById(int userId) async{
     
    return await get(Uri.parse(apiPath+userId.toString()));
  
  
    
  }
  
  
}
