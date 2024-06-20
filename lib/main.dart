import 'package:flutter/material.dart';
import 'package:inventory_management_system/Screens/homescreen.dart';
import 'package:inventory_management_system/Screens/inventoryscreen.dart';
import 'package:inventory_management_system/Screens/starterpage.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:inventory_management_system/providers/counter_provider.dart';
import 'package:provider/provider.dart';

void main() async {
  await dotenv.load(fileName: '.env');
  runApp(
    ChangeNotifierProvider(
      create: (context) => CounterProvider(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  build(context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: StarterPage('${dotenv.env['APP_NAME']}'),
      routes: {
        '/home': (context) => const HomeScreen(),
        '/inventory': (context) => const InventoryScreen(),
        '/welcome': (context) => StarterPage('${dotenv.env['APP_NAME']}'),
      },
    );
  }
}
