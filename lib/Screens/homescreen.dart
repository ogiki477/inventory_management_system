import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  @override
  build(context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("HomePage"),
        backgroundColor: const Color.fromARGB(255, 205, 209, 205),
        elevation: 20,
      ),
      body: const Text("Coming Soon!!!!"),
    );
  }
}
