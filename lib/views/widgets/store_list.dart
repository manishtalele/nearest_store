import 'package:flutter/material.dart';
import 'package:nearest_store/provider/store_provider.dart';
import 'package:provider/provider.dart';

class StoreList extends StatelessWidget {
  final VoidCallback onStoreSelected;

  const StoreList({required this.onStoreSelected, super.key});

  @override
  Widget build(BuildContext context) {
    final storeProvider = Provider.of<StoreProvider>(context);

    return Column(
      children: storeProvider.stores.map((store) {
        final bool isSelected = storeProvider.selectedStore?.code == store.code;

        return Padding(
          padding: const EdgeInsets.all(6.0),
          child: ElevatedButton(
            onPressed: () {
              storeProvider.selectStore(store);
              onStoreSelected();
            },
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.all(16.0),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
                side: BorderSide(
                  color: isSelected ? Colors.green : Colors.brown,
                  width: 2.0,
                ),
              ),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Icon(
                  Icons.store,
                  size: 24,
                ),
                const SizedBox(width: 10),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      store.storeLocation,
                      style: const TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 6),
                      child: Text(
                        store.storeAddress,
                        overflow: TextOverflow.clip,
                        style: const TextStyle(fontSize: 14.0),
                      ),
                    ),
                    Text(
                      '${store.dayOfWeek} ${store.startTime}-${store.endTime}',
                      style: const TextStyle(fontSize: 14.0),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      }).toList(),
    );
  }
}
