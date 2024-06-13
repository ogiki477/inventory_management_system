import 'package:flutter/material.dart';

class InventoryScreen extends StatelessWidget {
  const InventoryScreen({super.key});
  @override
  build(context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Inventory Items"),
        backgroundColor: const Color.fromARGB(255, 205, 209, 205),
      ),
      body: Container(
        width: 350,
        //color: Colors.green,
        child: ListView(
          children: const [
            ListTile(
              title: Text(
                "Electronics",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.blue,
                    fontSize: 28),
              ),
              subtitle: Text(
                "Comprises of electronic items",
                style: TextStyle(
                  fontWeight: FontWeight.normal,
                  color: Colors.black,
                  fontSize: 18,
                ),
              ),
              leading: Icon(Icons.electric_rickshaw),
            ),
            Divider(),
            ListTile(
              title: Text(
                "Groceries",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.blue,
                    fontSize: 28),
              ),
              subtitle: Text(
                "Comprises of household food stuff",
                style: TextStyle(
                  fontWeight: FontWeight.normal,
                  color: Colors.black,
                  fontSize: 18,
                ),
              ),
              leading: Icon(Icons.local_grocery_store),
            ),
            Divider(),
            ListTile(
              title: Text(
                "Home Appliances",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.blue,
                    fontSize: 28),
              ),
              subtitle: Text(
                "Comprises of household appliances",
                style: TextStyle(
                  fontWeight: FontWeight.normal,
                  color: Colors.black,
                  fontSize: 18,
                ),
              ),
              leading: Icon(Icons.fire_extinguisher_rounded),
            ),
            Divider(),
            ListTile(
              title: Text(
                "Office Supplies",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.blue,
                    fontSize: 28),
              ),
              subtitle: Text(
                "Comprises of items commonly used in offices",
                style: TextStyle(
                  fontWeight: FontWeight.normal,
                  color: Colors.black,
                  fontSize: 18,
                ),
              ),
              leading: Icon(Icons.local_post_office),
            ),
            Divider(),
            ListTile(
              title: Text(
                "Clothing",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.blue,
                    fontSize: 28),
              ),
              subtitle: Text(
                "Comprises of apparel items",
                style: TextStyle(
                  fontWeight: FontWeight.normal,
                  color: Colors.black,
                  fontSize: 18,
                ),
              ),
              leading: Icon(Icons.collections_sharp),
            ),
            Divider(),
            ListTile(
              title: Text(
                "Toys",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.blue,
                    fontSize: 28),
              ),
              subtitle: Text(
                "Comprises of games",
                style: TextStyle(
                  fontWeight: FontWeight.normal,
                  color: Colors.black,
                  fontSize: 18,
                ),
              ),
              leading: Icon(Icons.toys),
            ),
          ],
        ),
      ),
    );
  }
}
