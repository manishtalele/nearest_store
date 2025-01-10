class Store {
  final String code;
  final String storeLocation;
  final double latitude;
  final double longitude;
  final String storeAddress;
  final String timezone;
  final double distance;
  final bool isNearestStore;
  final String dayOfWeek;
  final String startTime;
  final String endTime;

  Store({
    required this.code,
    required this.storeLocation,
    required this.latitude,
    required this.longitude,
    required this.storeAddress,
    required this.timezone,
    required this.distance,
    required this.isNearestStore,
    required this.dayOfWeek,
    required this.startTime,
    required this.endTime,
  });

  factory Store.fromJson(Map<String, dynamic> json) {
    return Store(
      code: json['code'],
      storeLocation: json['storeLocation'],
      latitude: double.parse(json['latitude']),
      longitude: double.parse(json['longitude']),
      storeAddress: json['storeAddress'],
      timezone: json['timezone'],
      distance: json['distance'],
      isNearestStore: json['isNearestStore'] == 1,
      dayOfWeek: json['dayOfWeek'],
      startTime: json['start_time'],
      endTime: json['end_time'],
    );
  }
}
