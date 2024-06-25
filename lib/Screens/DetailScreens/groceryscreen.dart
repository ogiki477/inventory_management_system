import 'package:flutter/material.dart';

class GroceryScreen extends StatelessWidget {
  const GroceryScreen({super.key});

  @override
  build(context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Groceries",
          style: TextStyle(
            fontWeight: FontWeight.normal,
          ),
        ),
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
                  "Eggs",
                  style: TextStyle(fontSize: 40),
                ),
                Image.asset('assets/images/eggs.jpeg'),
                const Text(
                  "A common food item laid by birds, especially chickens. They are versatile and used in many recipes.",
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
