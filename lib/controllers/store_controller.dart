import 'package:nearest_store/models/store_model.dart';
import 'package:nearest_store/services/api_service.dart';

class StoreController {
  final ApiService _apiService = ApiService();

  Future<List<Store>> getStores() {
    return _apiService.fetchStores();
  }
}
