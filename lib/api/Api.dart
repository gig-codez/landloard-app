import 'package:nyumbayo_app/exports/exports.dart';

class Api {
  static const String devUrl = "http://192.168.0.37:4045";
  static String adminLogin = "$devUrl/auth/login/landlord";
  static String adminCreate = "$devUrl/auth/create/landlord";
  static String addProperty = "$devUrl/post/create/property";
  static String properties = "$devUrl/get/landlord/property/";
  static String complaints = "$devUrl/get/complaints";
  static String saveTenant = "$devUrl/auth/create/tenant";
  static String tenants = "$devUrl/get/tenants/";
  static String powerApi =
      "https://api.thingspeak.com/update.json?api_key=EIGVFVMPGBKK86VQ&field1=";
  // function to trigger the power
  static Future<Response> triggerPower(String field2) async {
    var response = await Client().post(Uri.parse(powerApi + field2));
    return response;
  }
}
