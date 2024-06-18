import 'package:flutter/material.dart';

class HomeApplianceScreen extends StatelessWidget {
  const HomeApplianceScreen({super.key});

  @override
  build(context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Appliances"),
        backgroundColor: Colors.green,
        elevation: 20,
      ),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(10),
            child: Column(
              children: [
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  "Fridge",
                  style: TextStyle(fontSize: 40),
                ),
                Image.asset('assets/images/fridge.jpeg'),
                const Text(
                  "An appliance for keeping food and drinks cold. It usually has a freezer compartment for storing frozen items.",
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
