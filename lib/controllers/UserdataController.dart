import 'package:nyumbayo_app/exports/exports.dart';

class UserdataController extends Cubit<String> {
  UserdataController() : super("");
// capture user data
  void captureData(String id){
  SharedPreferences.getInstance().then((value) {
    value.setString("userId",id);
    emit(id);
  });
  }
  getUserData(){
    SharedPreferences.getInstance().then((userData) {
      emit(userData.getString("userId")?? "");
    });
  }
}