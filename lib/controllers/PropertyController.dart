import "../api/Api.dart";
import "/exports/exports.dart";

class PropertyController extends Cubit<List<PropertiesModel>> {
  PropertyController() : super([]);
  void fetchProperties(String userId) {
    Client().get(Uri.parse(Api.properties + userId)).then((value) {
      var data = propertiesModelFromJson(value.body);
      emit(data);
    });
  }
}
