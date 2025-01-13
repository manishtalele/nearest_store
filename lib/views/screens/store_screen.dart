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
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _storeController.getStores().then((stores) {
      Provider.of<StoreProvider>(context, listen: false).setStores(stores);
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void scrollToTop() {
    _scrollController.animateTo(
      0.0,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Stores'),
        centerTitle: true,
        backgroundColor: Colors.orange.shade800,
      ),
      body: ListView(
        controller: _scrollController,
        children: [
          SizedBox(
            height: 300,
            child: MapView(),
          ),
          StoreList(onStoreSelected: scrollToTop),
        ],
      ),
    );
  }
}
