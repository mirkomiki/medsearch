import 'package:flutter/material.dart';
class ReportBug extends StatefulWidget {
  const ReportBug({super.key});

  @override
  State<ReportBug> createState() => _ReportBugState();
}

class _ReportBugState extends State<ReportBug> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      appBar: AppBar(
        title: const Text('Report bug'),
        backgroundColor: const Color.fromARGB(255, 0, 164, 164),
      ),
    );
  }
}