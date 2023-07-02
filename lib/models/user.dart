class UserModel {
  int userId;
  String phoneNumber;
  String firstName;
  String LastName;

  UserModel(this.phoneNumber, this.firstName,this.LastName, this.userId);

  factory UserModel.fromJson(Map<String, dynamic> userData) {
    return UserModel(
      userData['phone'],
      userData['name']["firstname"],
      userData['name']["lastname"],
      userData['id'],
    );
  }
}
