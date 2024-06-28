import 'package:flutter/material.dart';
// import 'package:inventory_management_system/Screens/counterscreen.dart';
import 'package:inventory_management_system/Screens/homescreen.dart';
import 'package:inventory_management_system/Screens/inventoryscreen.dart';
import 'package:inventory_management_system/Screens/settingscreen.dart';

class StarterPage extends StatefulWidget {
  StarterPage(this.title, {super.key});
  String title;
  @override
  State<StarterPage> createState() {
    return _StarterPageState();
  }
}

class _StarterPageState extends State<StarterPage> {
  int _currentIndex = 0;

  List<Widget> screens = [
    HomeScreen(),
    InventoryScreen(),
    SettingScreen(),
  ];

  @override
  build(context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text(
      //     widget.title,
      //     style: const TextStyle(
      //       fontSize: 28,
      //       fontWeight: FontWeight.bold,
      //     ),
      //   ),
      //   backgroundColor: Colors.green,
      //   elevation: 20,
      // ),
      body: screens[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.inventory),
            label: "Inventory",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: "Settings",
          ),
        ],
        backgroundColor: const Color.fromARGB(255, 165, 192, 165),
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        iconSize: 30,
      ),
    );
  }
}
