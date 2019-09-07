import 'package:scoped_model/scoped_model.dart';

class NPSMasspaAppModel extends Model {

  //setup multi language
  String locale = 'vi';

  void onChangeLanguage(String language){
    locale=language;
  }

}