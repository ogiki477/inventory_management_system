import 'package:flutter/material.dart';
import 'package:inventory_management_system/Screens/homescreen.dart';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
      appBar: AppBar( 
        title: const Text("HomePage"),
        backgroundColor: Colors.green,
        elevation: 20,
      
      ),
      body: const HomeScreen(),

      ),
    ),
  );
}
