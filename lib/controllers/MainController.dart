// ignore_for_file: non_constant_identifier_names

import '../models/Complaints.dart';
import '/backend/complaints.dart';

import '../tools/index.dart';
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
// Listen for new complaints

// Track the last complaint document ID
  String lastDocumentId = "";

// Listen for new complaints
  void listenToNewComplaints(QuerySnapshot<Map<String, dynamic>> snapshot) {
    // firestoreInstance
    //     .collection('complaints')
    //     .orderBy('date', descending: true)
    //     .snapshots()
    //     .listen((snapshot) {
    for (var docChange in snapshot.docChanges) {
      if (docChange.doc.data()!["accessKey"] == '0') {
        if (docChange.type == DocumentChangeType.added) {
          // Check if this is a new complaint
          // Handle new complaint notification
          String msg = docChange.doc.data()!['title'];
          // trigger a notification showing who sent it
          FirebaseFirestore.instance
              .collection("complaints")
              .doc(docChange.doc.id)
              .update({
            'accessKey': '1',
          });

          sendNotification(
              body: msg, title: 'New Complaint', notification_id: 1);
          // Display a notification or perform any desired action
          // to notify the landlord about the new complaint
          // Update the last complaint document ID
          lastDocumentId = docChange.doc.id;
        }
      }
    }
    // });
  }
}
