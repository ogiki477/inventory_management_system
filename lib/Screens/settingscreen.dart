import 'package:flutter/material.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});
  @override
  build(context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Settings"),
        backgroundColor: const Color.fromARGB(255, 205, 209, 205),
        elevation: 20,
      ),
      body: const Column(
        //mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Coming Soon!!!!",
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
