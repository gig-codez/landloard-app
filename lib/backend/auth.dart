// ignore_for_file: use_build_context_synchronously

import '../api/Api.dart';
import '../tools/SessionManager.dart';
import '/exports/exports.dart';

FirebaseFirestore _db = FirebaseFirestore.instance;
FirebaseAuth _auth = FirebaseAuth.instance;

class Auth {
  // landlord sign
  static Future<void> signinLandlord(
      String email, String password, BuildContext context) async {
    String msg = "";
    // Add a new document with a generated ID
    try {
      Response response = await Client().post(
        Uri.parse(Api.adminLogin),
        body: {"email": email, "password": password},
      );
      if (response.statusCode == 200) {
        Map<String, dynamic> data = json.decode(response.body);
        BlocProvider.of<UserdataController>(context)
            .captureData(data["data"]["userId"]);
        showMessage(context: context, msg: data["message"], type: 'success');
      }
    } on ClientException catch (e, _) {
      msg = e.message;
      showMessage(context: context, msg: msg, type: 'warning');
    }
  }

  // create landlord account
  static Future<void> createLandlord(
      Landlord user, BuildContext context) async {
    String msg = "";

    //creating the user collection in the firestore database
    try {
      var action = MultipartRequest("POST", Uri.parse(Api.adminCreate))
        ..fields["name"] = user.name
        ..fields["email"] = user.email
        ..fields["contact"] = user.contact
        ..fields["address"] = user.address
        ..fields["profile"] = user.profile
        ..fields["password"] = user.password;
      var response = await action.send();
      if (response.statusCode == 200) {
        // Map<String, dynamic> data = json.decode(response.stream.bytesToString());
        showMessage(
            context: context, msg: "Added successfully", type: 'success');
      }
    } on ClientException catch (e, _) {
      msg = e.message;
      showMessage(context: context, msg: msg, type: 'warning');
    }
  }

// landlord sign out
  static Future<void> signOut() async {
    await SessionManager().clearToken();
  }
}
