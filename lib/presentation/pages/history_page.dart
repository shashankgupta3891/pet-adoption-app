import 'package:flutter/material.dart';

class HistoryPage extends StatelessWidget {
  const HistoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Adoption History'),
      ),
      body: const Center(
        child: Text(
          'No adoption history yet.',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
