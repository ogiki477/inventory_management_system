import 'package:flutter/material.dart';

class ElectronicScreen extends StatelessWidget {
  const ElectronicScreen({super.key});

  @override
  build(context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Electronics"),
        backgroundColor: Colors.green,
        elevation: 20,
      ),
      body: ListView(
        children: [
          Container(
            padding: EdgeInsets.all(10),
            child: Column(
              children: [
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  "Laptop",
                  style: TextStyle(fontSize: 40),
                ),
                Image.asset('assets/images/Dell1.jpg'),
                const Text(
                  "A portable computer with a screen and keyboard integrated into a single unit. Often used for work, study, and entertainment.",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.all(10),
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue[100],
                ),
                onPressed: () {
                  Navigator.pushNamed(context, '/inventory');
                },
                child: const Text(
                  "Go to Inventory List",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                  ),
                )),
          ),
        ],
      ),
    );
  }
}
