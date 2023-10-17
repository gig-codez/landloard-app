import '../models/TenantsModel.dart';
import '/exports/exports.dart';

class TenantController extends Cubit<List<TenantsModel>> {
  TenantController() : super([]);
  void fetchTenants(String id,String property) {
    TenantData.fetchTenants(id,property).then((value) {
      emit(value.where((element) => element.landlord == id && element.property == property).toList());
    });
  }
}
