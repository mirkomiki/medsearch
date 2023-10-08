import 'package:flutter/material.dart';

class Settings extends StatefulWidget {
  const Settings({super.key});

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: const [CircleAvatar(radius: 9)],
        title: const Text('Settings', style: TextStyle(color: Color.fromARGB(255, 255, 255, 255)), ),
        backgroundColor: Colors.grey[900],
        titleTextStyle: TextStyle(fontSize: 24, letterSpacing: 1.2),
        shadowColor: Colors.grey[900],
      ),

      backgroundColor: Colors.grey[900],
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
             TextButton(onPressed: () {
              Navigator.pushNamed(context, '/user');
              }, 
              child: const Text('Edit Account'),
              ),
          ],
           
        ),
      )
      
    );
  }
}