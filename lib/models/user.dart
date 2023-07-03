class User {
  int userId;
  String phoneNumber;
  String firstName;
  String lastName;

  User(this.phoneNumber, this.firstName, this.lastName, this.userId);

  factory User.fromJson(Map<String, dynamic> userData) {
    return User(
      userData['phone'],
      userData['name']['firstname'],
      userData['name']['lastname'],
      userData['id'],
    );
  }
}
