// ignore_for_file: use_build_context_synchronously

import '../api/Api.dart';
import '/exports/exports.dart';

class Properties {
  static Future<void> addProperty(
      var prop, String user_id, BuildContext context) async {
    // adding new property
    var p = {
      "name": prop["name"],
      "address": prop["address"],
      "floors": prop["floors"],
      "rooms": prop["rooms"],
      "landlord": user_id,
    };
    var response = await Client().post(Uri.parse(Api.addProperty), body: p);
    if (response.statusCode == 200) {
      showMessage(context: context, msg: "Added successfully", type: 'success');
    } else {
      showMessage(
          context: context, msg: "Failed to add property", type: 'warning');
    }
  }

  static Future<List<PropertiesModel>> getProperties(String userId) async {
    var response = await Client().get(Uri.parse(Api.properties + userId));
    var data = propertiesModelFromJson(response.body);
    return data;
  }
}
