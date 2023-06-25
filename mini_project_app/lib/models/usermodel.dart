class UserModel{
  String phoneNumber;
  Map<String,dynamic> userFullName;
  UserModel(this.phoneNumber,this.userFullName){}
   factory UserModel.fromJson(Map<String,dynamic>userData){
    return UserModel(userData['phone'],userData['name']);
  }

}