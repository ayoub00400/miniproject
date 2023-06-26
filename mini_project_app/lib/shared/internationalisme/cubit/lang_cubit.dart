import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../internalstorage/appstorage.dart';
part 'lang_state.dart';

class LangCubit extends Cubit<LangState> {
  String defaultLang= 'ar';
  LangCubit() : super(LangInitial());
 


  initLang(){
    String ? checkLang= AppStorage.storageInstance!.getString('lang');
    if(checkLang != null){
      defaultLang=checkLang;
      
    }else{
      defaultLang="ar";
    }
  }

  changeAppLang(String langCodeUsed){
    if(defaultLang!=langCodeUsed){
      AppStorage.storageInstance!.setString("lang",langCodeUsed);
      defaultLang=langCodeUsed;
      emit(LangChanged());
    }
      
    }

  
}
