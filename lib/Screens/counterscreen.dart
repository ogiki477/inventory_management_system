import 'package:flutter/material.dart';
import 'package:inventory_management_system/providers/counter_provider.dart';
import 'package:provider/provider.dart';

class CounterScreen extends StatelessWidget {
  const CounterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final counter = Provider.of<CounterProvider>(context);
    final count = counter.count;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Counter Page"),
        backgroundColor: Colors.green,
        elevation: 20,
      ),
      body: Center(
        child: Text(
          textAlign: TextAlign.center,
          "You have pushed the button \n $count times ",
          style: Theme.of(context).textTheme.bodyLarge,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          counter.increment();
        },
        backgroundColor: const Color.fromARGB(255, 4, 131, 8),
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
    );
  }
}
