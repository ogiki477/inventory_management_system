import 'package:flutter/material.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});
  @override
  build(context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Settings"),
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
