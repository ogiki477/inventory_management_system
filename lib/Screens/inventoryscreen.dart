import 'package:flutter/material.dart';
import 'package:inventory_management_system/Screens/homescreen.dart';

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
          children: [
            ListTile(
              title: const Text(
                "Electronics",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.blue,
                    fontSize: 28),
              ),
              subtitle: const Text(
                "Comprises of electronic items",
                style: TextStyle(
                  fontWeight: FontWeight.normal,
                  color: Colors.black,
                  fontSize: 18,
                ),
              ),
              leading: const Icon(Icons.electric_rickshaw),
              trailing: const Icon(Icons.chevron_right),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const HomeScreen()),
                );
              },
            ),
            const Divider(),
            ListTile(
              title: const Text(
                "Groceries",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.blue,
                    fontSize: 28),
              ),
              subtitle: const Text(
                "Comprises of household food stuff",
                style: TextStyle(
                  fontWeight: FontWeight.normal,
                  color: Colors.black,
                  fontSize: 18,
                ),
              ),
              leading: const Icon(Icons.local_grocery_store),
              trailing: const Icon(
                Icons.chevron_right,
                color: Colors.blue,
              ),
              onTap: () {
                Navigator.pushNamed(context, '/homepage');
              },
            ),
            const Divider(),
            ListTile(
              title: const Text(
                "Home Appliances",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.blue,
                    fontSize: 28),
              ),
              subtitle: const Text(
                "Comprises of household appliances",
                style: TextStyle(
                  fontWeight: FontWeight.normal,
                  color: Colors.black,
                  fontSize: 18,
                ),
              ),
              leading: const Icon(Icons.fire_extinguisher_rounded),
              trailing: const Icon(Icons.chevron_right),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const HomeScreen()),
                );
              },
            ),
            Divider(),
            ListTile(
              title: const Text(
                "Office Supplies",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.blue,
                    fontSize: 28),
              ),
              subtitle: const Text(
                "Comprises of items commonly used in offices",
                style: TextStyle(
                  fontWeight: FontWeight.normal,
                  color: Colors.black,
                  fontSize: 18,
                ),
              ),
              leading: const Icon(Icons.local_post_office),
              trailing: const Icon(
                Icons.chevron_right,
                color: Colors.blue,
              ),
              onTap: () {
                Navigator.pushNamed(context, '/homepage');
              },
            ),
            const Divider(),
          ],
        ),
      ),
    );
  }
}
