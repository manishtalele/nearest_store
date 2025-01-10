import 'package:flutter/material.dart';
import 'package:nearest_store/controllers/store_controller.dart';
import 'package:nearest_store/provider/store_provider.dart';
import 'package:nearest_store/views/widgets/map_view.dart';
import 'package:nearest_store/views/widgets/store_list.dart';
import 'package:provider/provider.dart';

class StoreScreen extends StatefulWidget {
  const StoreScreen({super.key});

  @override
  _StoreScreenState createState() => _StoreScreenState();
}

class _StoreScreenState extends State<StoreScreen> {
  final StoreController _storeController = StoreController();

  @override
  void initState() {
    super.initState();
    _storeController.getStores().then((stores) {
      Provider.of<StoreProvider>(context, listen: false).setStores(stores);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Stores'),
        centerTitle: true,
        backgroundColor: Colors.orange.shade800,
      ),
      body: Column(
        children: [
          Expanded(
            flex: 1,
            child: MapView(),
          ),
          Expanded(
            flex: 1,
            child: StoreList(),
          ),
        ],
      ),
    );
  }
}
