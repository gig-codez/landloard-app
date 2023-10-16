import '../api/Api.dart';
import '../models/TenantsModel.dart';
import '/exports/exports.dart';

class TenantData {
  static Future<List<TenantsModel>> fetchTenants(String id) async {
  var response = await Client().get(Uri.parse(Api.tenants + id));
  return tenantsModelFromJson(response.body);
  }

  static Future<int> saveTenantDetails(
      Tenants prop, String property, String landlordId) async {
    Map<String, dynamic> p = {
      "name": prop.name,
      "password": "test123",
      "email": prop.email,
      "contact": prop.contact,
      "phone": prop.acontact,
      "address": prop.address,
      "roomNumber": prop.roomNumber,
      "monthly_rent": prop.monthlyRent,
      // "amountPaid": prop.amountPaid,
      "power_status": "off",
      "landlord": landlordId,
      "power_fee": "0",
      // "balance":(int.parse(prop.monthlyRent) - int.parse(prop.amountPaid)).toString(),
      "property": property,
    };
    Response res = await Client().post(Uri.parse(Api.saveTenant), body: p);
    return res.statusCode;
  }
}
