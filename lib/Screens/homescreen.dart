import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:inventory_management_system/Screens/counterscreen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  @override
  build(context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("HomePage"),
        backgroundColor: const Color.fromARGB(255, 205, 209, 205),
        elevation: 20,
      ),
      body: Column(
        children: [
          const Card(
            color: Color.fromARGB(255, 221, 207, 166),
            child: Text(
              "Wecome to the Home Page",
              style: TextStyle(
                fontSize: 50,
                fontStyle: FontStyle.normal,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Expanded(
            child: Container(
              height: 50,
              decoration: const BoxDecoration(
                  gradient: LinearGradient(colors: [
                Colors.green,
                Colors.yellow,
              ])),
            ),
          ),
          Column(
            children: [
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
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  FloatingActionButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const CounterScreen()),
                      );
                    },
                    backgroundColor: Colors.blue,
                    child: Text("Counter"),
                  ),
                ],
              )
            ],
          ),
        ],
      ),
    );
  }
}
