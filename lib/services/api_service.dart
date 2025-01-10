import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:nearest_store/models/store_model.dart';

class ApiService {
  Future<List<Store>> fetchStores() async {
    final response = await http
        .get(Uri.parse('https://atomicbrain.neosao.online/nearest-store'));

    if (response.statusCode == 200) {
      final jsonResponse = json.decode(response.body);
      final data = jsonResponse['data'] as List;
      return data.map((store) => Store.fromJson(store)).toList();
    } else {
      throw Exception('Failed to load stores');
    }
  }
}
