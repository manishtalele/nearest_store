import 'package:flutter/material.dart';
import 'package:nearest_store/models/store_model.dart';

class StoreProvider with ChangeNotifier {
  List<Store> _stores = [];
  Store? _selectedStore;

  List<Store> get stores => _stores;
  Store? get selectedStore => _selectedStore;

  void setStores(List<Store> stores) {
    _stores = stores;
    notifyListeners();
  }

  void selectStore(Store store) {
    _selectedStore = store;
    notifyListeners();
  }
}
