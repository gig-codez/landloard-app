import '/exports/exports.dart';

class PropertyIdController extends Cubit<String> {
  PropertyIdController() : super("652d345132a21c673a0abd64");

  //  FirebaseFirestore.instance.collection("properties").get()
  void setPropertyId(String id) {
    SharedPreferences.getInstance().then((value) {
      value.setString("propertyId", id);
    });
    emit(id);
  }

  // get property
  void getPropertyId() {
    SharedPreferences.getInstance().then((value) {
      emit(value.getString("propertyId") ?? "652d345132a21c673a0abd64");
    });
  }
}
