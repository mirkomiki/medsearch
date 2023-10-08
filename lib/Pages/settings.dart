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
      
      
      backgroundColor: Colors.grey[900],
      body: SafeArea(
        minimum: EdgeInsets.only(top: 35, left: 20),
        child: SingleChildScrollView(
          child: Column(
      
            children: <Widget>[
              const Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 3,
                    child: 
                      Text('Settings', 
                        style: TextStyle(color: Color.fromARGB(255, 255, 255, 255), fontSize: 28),
                      ),
                    
                  ),
                  Expanded(child: CircleAvatar(radius: 28,), flex: 1,)
                ],
              ),
              SizedBox(height: 25,),
              Row(mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                TextButton(onPressed: () {
                  Navigator.pushNamed(context, '/user');
                  }, 
                  child: Text('Edit Account', style: TextStyle(fontSize: 20),),
                  )
              ],
              ),
              SizedBox(height: 25,),
              Row(mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                TextButton(onPressed: () {
                  Navigator.pushNamed(context, '/edit-family-settings');
                  }, 
                  child: Text('Edit Family Settings', style: TextStyle(fontSize: 20),),
                  )
              ],
              ),
              SizedBox(height: 25,),
              Row(mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                TextButton(onPressed: () {
                  Navigator.pushNamed(context, '/add-family-member');
                  }, 
                  child: Text('Add Family Member', style: TextStyle(fontSize: 20),),
                  )
              ],
              ),
              SizedBox(height: 25,),
              Row(mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                TextButton(onPressed: () {
                  Navigator.pushNamed(context, '/report-bug');
                  }, 
                  child: Text('Report Bug', style: TextStyle(fontSize: 20),),
                  )
              ],
              ),
              SizedBox(height: 25,),
            ],
             
          ),
        ),
      )
      
    );
  }
}