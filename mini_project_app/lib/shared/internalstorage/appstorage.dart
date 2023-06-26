import 'package:shared_preferences/shared_preferences.dart' ;

class AppStorage{
  static   SharedPreferences? storageInstance;
  static Future<void> initStorageInstance()async{
    storageInstance = await  SharedPreferences.getInstance();
  }
}