import 'package:flutter/material.dart';

class MyOredersScreen extends StatelessWidget {
  const MyOredersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green,
      appBar: AppBar(title: const Text('My Orders')),
      body: const Center(child: Text('My Orders Screen')),
    );
  }
}
