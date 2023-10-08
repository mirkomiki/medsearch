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
        backgroundColor: const Color.fromARGB(255, 26, 26, 26),
      ),
      backgroundColor: const Color.fromARGB(255, 26, 26, 26),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: <Widget>[
          TextButton(onPressed: () {Navigator.pushNamed(context, '/user');}, child: Text('Edit Account'))
        ],
      ),
    );
  }
}