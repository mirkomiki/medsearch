import 'package:flutter/material.dart';

class newTherapy extends StatefulWidget {
  const newTherapy({super.key});

  @override
  State<newTherapy> createState() => _newTherapyState();
}

class _newTherapyState extends State<newTherapy> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      appBar: AppBar(
        title: const Text('Create New Therapy'),
        backgroundColor: const Color.fromARGB(255, 0, 164, 164),
      ),
    );
  }
}