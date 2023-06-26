import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'lang_state.dart';

class LangCubit extends Cubit<LangState> {
  String defaultLang= 'ar';
  LangCubit() : super(LangInitial());
  changeLang(String lanfCode){
    defaultLang=lanfCode;
    emit(LangChanged());
  }
}
