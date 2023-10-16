import '../models/TenantsModel.dart';
import '/exports/exports.dart';

class TenantController extends Cubit<List<TenantsModel>> {
  TenantController() : super([]);
  void fetchTenants(String id) {
    TenantData.fetchTenants(id).then((value) {
      emit(value.where((element) => element.landlord == id).toList());
    });
  }
}
