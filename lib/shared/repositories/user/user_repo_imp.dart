import 'dart:convert';

import 'package:http/http.dart' as http;

import '../../../models/user.dart';
import '../../utils/urls.dart';
import 'user_repo.dart';

class UserRepository implements IUserRepository {
  @override
  Future<List<User>> getAllUsers() async {
    try {
      http.Response response = await http.get(Uri.parse(Urls.users));

      if (response.statusCode == 200) {
        var decodedResponse = jsonDecode(response.body);
        List<User> usersList;
        usersList = (decodedResponse as List)
            .map((userData) => User.fromJson(userData))
            .toList();

        return usersList;
      } else {
        throw Exception('server down');
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  @override
  Future<User> getUserById(int userId) async {
    try {
      http.Response response =
          await http.get(Uri.parse('${Urls.users}/$userId'));

      if (response.statusCode == 200) {
        var decodedResponse = jsonDecode(response.body);
        User user = User.fromJson(decodedResponse);

        return user;
      } else {
        throw Exception('server down');
      }
    } catch (e) {
      throw Exception(e);
    }
  }
}
