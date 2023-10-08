import 'package:flutter/material.dart';

class Reminders extends StatefulWidget {
  const Reminders({super.key});

  @override
  State<Reminders> createState() => _RemindersState();
}

class _RemindersState extends State<Reminders> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      appBar: AppBar(
        title: const Text('Reminders'),
        backgroundColor: const Color.fromARGB(255, 0, 164, 164),
      ),
    );
  }
}
