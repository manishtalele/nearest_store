import 'package:flutter/material.dart';
import 'package:nearest_store/provider/store_provider.dart';
import 'package:nearest_store/views/screens/store_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => StoreProvider(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Store Locator',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: StoreScreen(),
    );
  }
}
