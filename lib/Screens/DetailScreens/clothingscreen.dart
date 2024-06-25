import 'package:flutter/material.dart';

class ClothingScreen extends StatelessWidget {
  const ClothingScreen({super.key});

  @override
  build(context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Clothing"),
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
                  "Shirts",
                  style: TextStyle(fontSize: 40),
                ),
                Image.asset('assets/images/shirts.jpg'),
                const Text(
                  "Shirts are typically made of cotton, with short sleeves and round necklines. They are often worn as a basic, everyday top",
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
