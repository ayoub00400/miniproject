
import 'package:mini_project_app/models/user.dart';
abstract class IUserRepository{

  Future <List<UserModel>>  getAllUsers();
  Future <UserModel>  getUserById(int userId);

}