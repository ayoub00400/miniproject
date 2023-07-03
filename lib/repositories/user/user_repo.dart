import '../../models/user.dart';

abstract class IUserRepository {
  Future<List<User>> getAllUsers();

  Future<User> getUserById(int userId);
}
