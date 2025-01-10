import 'package:flutter/material.dart';
import 'package:nearest_store/provider/store_provider.dart';
import 'package:provider/provider.dart';

class StoreList extends StatelessWidget {
  const StoreList({super.key});

  @override
  Widget build(BuildContext context) {
    final storeProvider = Provider.of<StoreProvider>(context);

    return ListView.builder(
      itemCount: storeProvider.stores.length,
      itemBuilder: (context, index) {
        final store = storeProvider.stores[index];

        return Padding(
          padding: const EdgeInsets.all(6.0),
          child: ElevatedButton(
            onPressed: () {
              storeProvider.selectStore(store);
            },
            style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.all(16.0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                  side: BorderSide(color: Colors.brown),
                )),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Icon(
                  Icons.store,
                  color: Colors.brown,
                  size: 24,
                ),
                SizedBox(
                  width: 10,
                ),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(store.storeLocation,
                        style: TextStyle(
                            fontSize: 18.0, fontWeight: FontWeight.bold)),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 6),
                      child: Text(store.storeAddress,
                          overflow: TextOverflow.clip,
                          style: TextStyle(fontSize: 14.0)),
                    ),
                    Text(
                        '${store.dayOfWeek} ${store.startTime}-${store.endTime}',
                        style: TextStyle(fontSize: 14.0)),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
