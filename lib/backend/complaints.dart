import '../models/Complaints.dart';
import '/exports/exports.dart';
import '/api/Api.dart';

class Complaints {
  static Future<List<ComplaintsModel>> fetchComplaints() async {
    var response = await Client().get(Uri.parse(Api.complaints ));
    var data = complaintsModelFromJson(response.body);
    return data;
  }
}
