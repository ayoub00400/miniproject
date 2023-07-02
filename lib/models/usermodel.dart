class UserModel{
  int userId;
  String phoneNumber;
  Map<String,dynamic> userFullName;
  UserModel(this.phoneNumber,this.userFullName,this.userId);
   factory UserModel.fromJson(Map<String,dynamic>userData){
    return UserModel(userData['phone'],userData['name'],userData['id']);
  }

}