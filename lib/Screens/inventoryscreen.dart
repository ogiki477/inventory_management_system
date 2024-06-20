import 'package:flutter/material.dart';
import 'package:inventory_management_system/Screens/DetailScreens/clothingscreen.dart';
import 'package:inventory_management_system/Screens/DetailScreens/electronicscreen.dart';
import 'package:inventory_management_system/Screens/DetailScreens/groceryscreen.dart';
import 'package:inventory_management_system/Screens/DetailScreens/homeappliancescreen.dart';
import 'package:inventory_management_system/providers/inventory_provider.dart';
import 'package:provider/provider.dart';

class InventoryScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final inventoryProvider = Provider.of<InventoryProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Inventory Items"),
        backgroundColor: const Color.fromARGB(255, 205, 209, 205),
      ),
      body: Container(
        width: 350,
        child: ListView.builder(
          itemCount: inventoryProvider.items.length,
          itemBuilder: (context, index) {
            final item = inventoryProvider.items[index];
            return Column(
              children: [
                const Divider(),
                ListTile(
                  title: Text(
                    item.name,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.blue,
                      fontSize: 28,
                    ),
                  ),
                  subtitle: Text(
                    item.description,
                    style: const TextStyle(
                      fontWeight: FontWeight.normal,
                      color: Colors.black,
                      fontSize: 18,
                    ),
                  ),
                  leading: Icon(_getIconForCategory(item.name)),
                  trailing: const Icon(Icons.chevron_right),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => _getScreenForCategory(item.name),
                      ),
                    );
                  },
                ),
              ],
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, '/form');
        },
        child: const Icon(Icons.add),
        backgroundColor: Colors.blue[100],
      ),
    );
  }

  IconData _getIconForCategory(String category) {
    switch (category) {
      case 'Electronics':
        return Icons.electric_rickshaw;
      case 'Groceries':
        return Icons.local_grocery_store;
      case 'Home Appliances':
        return Icons.fire_extinguisher_rounded;
      case 'Clothing':
        return Icons.collections_sharp;
      default:
        return Icons.category;
    }
  }

  Widget _getScreenForCategory(String category) {
    switch (category) {
      case 'Electronics':
        return const ElectronicScreen();
      case 'Groceries':
        return const GroceryScreen();
      case 'Home Appliances':
        return const HomeApplianceScreen();
      case 'Clothing':
        return const ClothingScreen();
      default:
        return InventoryScreen();
    }
  }
}



// OGIKI MOSES ODERA CODE BELOW........................................................................

// import 'package:flutter/material.dart';
// import 'package:flutter_form_builder/flutter_form_builder.dart';
// import 'package:inventory_management_system/Screens/DetailScreens/clothingscreen.dart';
// import 'package:inventory_management_system/Screens/DetailScreens/electronicscreen.dart';
// import 'package:inventory_management_system/Screens/DetailScreens/groceryscreen.dart';
// import 'package:inventory_management_system/Screens/DetailScreens/homeappliancescreen.dart';

// class InventoryScreen extends StatefulWidget {
//   const InventoryScreen({super.key});

//   @override
//   State<InventoryScreen> createState() => _InventoryScreenState();
// }

// class _InventoryScreenState extends State<InventoryScreen> {
//   @override
//   build(context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("Inventory Items"),
//         backgroundColor: const Color.fromARGB(255, 205, 209, 205),
//       ),
//       body: Container(
//         width: 350,
//         //color: Colors.green,
//         child: ListView(
//           children: [
//             const Divider(),
//             ListTile(
//               title: const Text(
//                 "Electronics",
//                 style: TextStyle(
//                     fontWeight: FontWeight.bold,
//                     color: Colors.blue,
//                     fontSize: 28),
//               ),
//               subtitle: const Text(
//                 "Comprises of electronic items",
//                 style: TextStyle(
//                   fontWeight: FontWeight.normal,
//                   color: Colors.black,
//                   fontSize: 18,
//                 ),
//               ),
//               leading: const Icon(Icons.electric_rickshaw),
//               trailing: const Icon(Icons.chevron_right),
//               onTap: () {
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(
//                     builder: (context) => const ElectronicScreen(),
//                   ),
//                 );
//               },
//             ),
//             const Divider(),
//             ListTile(
//               title: const Text(
//                 "Groceries",
//                 style: TextStyle(
//                     fontWeight: FontWeight.bold,
//                     color: Colors.blue,
//                     fontSize: 28),
//               ),
//               subtitle: const Text(
//                 "Comprises of household food stuff",
//                 style: TextStyle(
//                   fontWeight: FontWeight.normal,
//                   color: Colors.black,
//                   fontSize: 18,
//                 ),
//               ),
//               leading: const Icon(Icons.local_grocery_store),
//               trailing: const Icon(Icons.chevron_right),
//               onTap: () {
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(
//                       builder: (context) => const GroceryScreen()),
//                 );
//               },
//             ),
//             const Divider(),
//             ListTile(
//               title: const Text(
//                 "Home Appliances",
//                 style: TextStyle(
//                     fontWeight: FontWeight.bold,
//                     color: Colors.blue,
//                     fontSize: 28),
//               ),
//               subtitle: const Text(
//                 "Comprises of household appliances",
//                 style: TextStyle(
//                   fontWeight: FontWeight.normal,
//                   color: Colors.black,
//                   fontSize: 18,
//                 ),
//               ),
//               leading: const Icon(Icons.fire_extinguisher_rounded),
//               trailing: const Icon(Icons.chevron_right),
//               onTap: () {
//                 Navigator.push(
//                     context,
//                     MaterialPageRoute(
//                         builder: (context) => const HomeApplianceScreen()));
//               },
//             ),
//             const Divider(),
//             ListTile(
//               title: const Text(
//                 "Clothing",
//                 style: TextStyle(
//                     fontWeight: FontWeight.bold,
//                     color: Colors.blue,
//                     fontSize: 28),
//               ),
//               subtitle: const Text(
//                 "Comprises of apparel items",
//                 style: TextStyle(
//                   fontWeight: FontWeight.normal,
//                   color: Colors.black,
//                   fontSize: 18,
//                 ),
//               ),
//               leading: const Icon(Icons.collections_sharp),
//               trailing: const Icon(Icons.chevron_right),
//               onTap: () {
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(
//                       builder: (context) => const ClothingScreen()),
//                 );
//               },
//             ),
//             const Divider(),
//             Container(
//               padding: EdgeInsets.all(10),
//               child: ElevatedButton(
//                   style: ElevatedButton.styleFrom(
//                     backgroundColor: Colors.blue[100],
//                   ),
//                   onPressed: () {
//                     Navigator.pushNamed(context, '/form');
//                   },
//                   child: const Text(
//                     "Add more Items",
//                     style: TextStyle(
//                       color: Colors.black,
//                       fontSize: 18,
//                     ),
//                   )),
//             ),
//             const Divider(),
//             Container(
//               padding: EdgeInsets.all(10),
//               child: ElevatedButton(
//                   style: ElevatedButton.styleFrom(
//                     backgroundColor: Colors.green[100],
//                   ),
//                   onPressed: () {
//                     Navigator.pushNamed(context, '/welcome');
//                   },
//                   child: const Text(
//                     "Go to Welcome Page",
//                     style: TextStyle(
//                       color: Colors.black,
//                       fontSize: 18,
//                     ),
//                   )),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }


