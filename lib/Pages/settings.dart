import 'package:flutter/material.dart';
import 'package:medsearch/globals.dart';

class Settings extends StatefulWidget {
  const Settings({super.key});

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      
      backgroundColor: Colors.grey[900],
      body: SafeArea(
        minimum: const EdgeInsets.only(top: 35, left: 20),
        child: SingleChildScrollView(
          child: Column(
      
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const Expanded(
                    flex: 3,
                    child: 
                      Text('Settings', 
                        style: TextStyle(color: Color.fromARGB(255, 255, 255, 255), fontSize: 28),
                      ),
                    
                  ),
                  Expanded(flex: 1, child: CircleAvatar(radius: 30,child: localUser.avatar,),),
                ],
              ),
              const SizedBox(height: 25,),
              Row(mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                TextButton(onPressed: () {
                  Navigator.pushNamed(context, '/user').then((value) => setState(() => {}));
                  }, 
                  child: const Text('Edit Account', style: TextStyle(fontSize: 20),),
                  )
              ],
              ),
              const SizedBox(height: 25,),
              Row(mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                TextButton(onPressed: () {
                  Navigator.pushNamed(context, '/edit-family-settings');
                  }, 
                  child: const Text('Edit Family Settings', style: TextStyle(fontSize: 20),),
                  )
              ],
              ),
              const SizedBox(height: 25,),
              Row(mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                TextButton(onPressed: () {
                  Navigator.pushNamed(context, '/add-family-member');
                  }, 
                  child: const Text('Add Family Member', style: TextStyle(fontSize: 20),),
                  )
              ],
              ),
              const SizedBox(height: 25,),
              Row(mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                TextButton(onPressed: () {
                  Navigator.pushNamed(context, '/report-bug');
                  }, 
                  child: const Text('Report Bug', style: TextStyle(fontSize: 20),),
                  )
              ],
              ),
              const SizedBox(height: 25,),
            ],
             
          ),
        ),
      )
      
    );
  }
}