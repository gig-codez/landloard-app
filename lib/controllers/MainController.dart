// ignore_for_file: non_constant_identifier_names

import '../models/Complaints.dart';
import '/backend/complaints.dart';
import '/exports/exports.dart';

class MainController extends ChangeNotifier {
  // variables
  List<ComplaintsModel> _complaints = [];
  List<ComplaintsModel> _resolved_complaints = [];

  // getters
  List<ComplaintsModel> get complaints => _complaints;
  // tenant_id's Variable(
  String _tenantId = "";
// double
  double _amt = 0;
// get amount
  double get amt => _amt;
  // get tenant id
  String get tenantId => _tenantId;
  List<ComplaintsModel> get resolved_complaints => _resolved_complaints;
  // functions
  void fetchComplaints(String id) {
    Complaints.fetchComplaints().asStream().listen((event) {
      _complaints = event
          .where((element) =>
              (element.property == id) && element.complaintStatus == 'Pending')
          .map((e) => e)
          .toList();
      notifyListeners();
    });
  }

  void fetchResolvedComplaints(String id) {
    Complaints.fetchComplaints().asStream().listen((event) {
      // resolved complaints
      _resolved_complaints = event
          .where((element) =>
              (element.property == id) && element.complaintStatus == 'Resolved')
          .map((e) => e)
          .toList();
      notifyListeners();
    });
  }

  void setAmount(String id) {
    _amt = 0;
  }

  void captureTenantId(String id) {
    _tenantId = id;
    notifyListeners();
  }

}
