import 'package:flutter/material.dart';
import 'package:inventory_management_system/Screens/DetailScreens/clothingscreen.dart';
import 'package:inventory_management_system/Screens/DetailScreens/electronicscreen.dart';
import 'package:inventory_management_system/Screens/DetailScreens/groceryscreen.dart';
import 'package:inventory_management_system/Screens/DetailScreens/homeappliancescreen.dart';

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
            const SizedBox(
              height: 20,
            ),
            const Divider(),
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
                  MaterialPageRoute(
                    builder: (context) => const ElectronicScreen(),
                  ),
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
              trailing: const Icon(Icons.chevron_right),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const GroceryScreen()),
                );
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
                    MaterialPageRoute(
                        builder: (context) => const HomeApplianceScreen()));
              },
            ),
            const Divider(),
            ListTile(
              title: const Text(
                "Clothing",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.blue,
                    fontSize: 28),
              ),
              subtitle: const Text(
                "Comprises of apparel items",
                style: TextStyle(
                  fontWeight: FontWeight.normal,
                  color: Colors.black,
                  fontSize: 18,
                ),
              ),
              leading: const Icon(Icons.collections_sharp),
              trailing: const Icon(Icons.chevron_right),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const ClothingScreen()),
                );
              },
            ),
            const Divider(),
            Container(
              padding: EdgeInsets.all(10),
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue[100],
                  ),
                  onPressed: () {
                    Navigator.pushNamed(context, '/home');
                  },
                  child: const Text(
                    "Go to HomePage",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                    ),
                  )),
            ),
            const Divider(),
            Container(
              padding: EdgeInsets.all(10),
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green[100],
                  ),
                  onPressed: () {
                    Navigator.pushNamed(context, '/welcome');
                  },
                  child: const Text(
                    "Go to Welcome Page",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                    ),
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
