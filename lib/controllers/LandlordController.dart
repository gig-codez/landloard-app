import '/exports/exports.dart';

class LandlordController extends Cubit<Map<String, dynamic>> {
  LandlordController() : super(Map.from({}));
  void landLordData() {
    // initialize shared preferences
    // SharedPreferences.getInstance().then((value) {
    //   FirebaseFirestore.instance
    //       .collection("landlords")
    //       .doc(FirebaseAuth.instance.currentUser!.uid)
    //       .get()
    //       .then((usr) {
    //     emit(
    //       usr.data() ?? {},
    //     );
    //     value.setString("landLordData", json.encode(usr.data()));
    //   });
    // });
  }
  // retrieve landlord data
  void retrieveLandLordData() {
    SharedPreferences.getInstance().then((value) {
      emit(
        json.decode(value.getString("landLordData") ?? "{}"),
      );
    });
  }
}
