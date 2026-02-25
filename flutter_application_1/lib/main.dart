import 'package:flutter/material.dart';
import 'add_expense_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ExpensesHomePage(),
    );
  }
}

class ExpensesHomePage extends StatelessWidget {
  const ExpensesHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Expenses"),
      ),
      body: const Center(
        child: Text("No expenses yet"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final title = await Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const AddExpensePage(),
            ),
          );

          if (title != null) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text("Added: $title")),
            );
          }
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}