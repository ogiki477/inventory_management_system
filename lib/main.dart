import 'package:flutter/material.dart';
import 'package:inventory_management_system/starterpage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  build(context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: StarterPage(),
    );
  }
}
