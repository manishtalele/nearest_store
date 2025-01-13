import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:nearest_store/provider/store_provider.dart';
import 'package:provider/provider.dart';

class MapView extends StatefulWidget {
  const MapView({super.key});

  @override
  _MapViewState createState() => _MapViewState();
}

class _MapViewState extends State<MapView> {
  final MapController _mapController = MapController();
  bool _isMapInitialized = false;
  double _currentZoom = 16.0;

  @override
  Widget build(BuildContext context) {
    final storeProvider = Provider.of<StoreProvider>(context);

    final LatLng initialCenter = LatLng(16.688653, 74.272591);

    if (storeProvider.selectedStore != null && _isMapInitialized) {
      _mapController.move(
        LatLng(storeProvider.selectedStore!.latitude,
            storeProvider.selectedStore!.longitude),
        _currentZoom,
      );
    }

    return FlutterMap(
      mapController: _mapController,
      options: MapOptions(
        initialCenter: initialCenter,
        initialZoom: _currentZoom,
        onMapReady: () {
          setState(() {
            _isMapInitialized = true;
          });
        },
        onPositionChanged: (position, hasGesture) {
          setState(() {
            _currentZoom = position.zoom;
          });
        },
      ),
      children: [
        TileLayer(
          urlTemplate:
              'https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png', // Default OpenStreetMap tiles
        ),
        MarkerLayer(
          markers: storeProvider.stores.map((store) {
            final isSelected = storeProvider.selectedStore?.code == store.code;
            return Marker(
              point: LatLng(store.latitude, store.longitude),
              width: 40.0,
              height: 40.0,
              child: GestureDetector(
                onTap: () {
                  storeProvider.selectStore(store);
                  if (_isMapInitialized) {
                    _mapController.move(
                      LatLng(store.latitude, store.longitude),
                      _currentZoom,
                    );
                  }
                },
                child: Icon(
                  Icons.location_on,
                  color: isSelected ? Colors.red : Colors.blue,
                  size: isSelected ? 40 : 30,
                ),
              ),
            );
          }).toList(),
        ),
      ],
    );
  }
}
