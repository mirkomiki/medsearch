import 'package:flutter/material.dart';

class EditFamily extends StatefulWidget {
  const EditFamily({super.key});

  @override
  State<EditFamily> createState() => _EditFamilyState();
}

class _EditFamilyState extends State<EditFamily> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      appBar: AppBar(
        title: const Text('Family'),
        backgroundColor: const Color.fromARGB(255, 0, 164, 164),
      ),
    );
  }
}