import 'dart:ui';

import 'package:flutter/material.dart';
import 'therapy.dart';
void main() => runApp(MaterialApp(
  home: Home()
),
);


class Home extends StatefulWidget {
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  List<Therapy> therapies = [
    Therapy('Sinersul', 500, 1, 20),
    Therapy('Brufen', 1000, 2, 40)
  ];

  Widget dailyTherapyTemplate(therapy){
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30),
      ),
      shadowColor: Colors.black,
      surfaceTintColor: Colors.amber,
      color: Color.fromARGB(255, 188, 123, 224),
      margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
      child:
      
      Padding(
        
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Text(
            'Take: ${therapy.name} \nDosage:${therapy.dosage}\nRemaning pills:${therapy.pillsAvaliable}\nWhen:', 
            style: TextStyle(color: Colors.black, fontSize: 20),)
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    backgroundColor: Colors.grey[900],
    bottomNavigationBar: BottomNavigationBar(
    items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_month_outlined),
            label: 'Calendar',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.manage_accounts),
            label: 'Settings',
          ),
      ],  
      backgroundColor: Color.fromARGB(255, 26, 26, 26),
      unselectedItemColor: Color.fromARGB(129, 255, 255, 255),
      selectedItemColor: Colors.white,
    ),
    
    appBar: AppBar(
      title: Text('Smart therapy tracker'),
      centerTitle: true,
      backgroundColor: Color.fromARGB(255, 196, 82, 135),
    ),
    body: Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget> [
      Container(padding: EdgeInsets.all(5)),
      Divider(
        height: 40,
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
        CircleAvatar(radius: 36, backgroundImage: AssetImage('assets/baby.jpg', )),
        CircleAvatar(radius: 36, backgroundImage: AssetImage('assets/trump_avatar.jpg', )),
        CircleAvatar(radius: 36, backgroundImage: AssetImage('assets/scary_man.jpg', )),
        ],
      ),
      Divider(
        height: 40,
        color: Colors.grey[900],
      ),
      Column(
        children:
          therapies.map(
            (therapy) => dailyTherapyTemplate(therapy)
            )
            .toList(),
      ),
      
      
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          ElevatedButton(
            onPressed: () {}, 
            child: Text(
              style: TextStyle(fontSize: 20, color: Colors.black),
              'See full therapy'), 
            style: ButtonStyle(
              backgroundColor:MaterialStateProperty.all<Color>(Colors.amber))
          ),
          
          ElevatedButton.icon(
            onPressed: () {},
            icon: Icon( 
            Icons.add_alert_rounded,
            size: 24.0,
            ),
            label: Text(style: TextStyle(fontSize: 20),'Remind me', selectionColor: Colors.white,),
            style: ButtonStyle(
              backgroundColor:MaterialStateProperty.all<Color>(const Color.fromARGB(255, 196, 82, 135)),
              
              )
          ),
        ],
      ),
    ],
  ),
 
    floatingActionButton: FloatingActionButton(
      child: Icon(Icons.add,
      size: 36,
      ),
      onPressed: null,
      backgroundColor: Color.fromARGB(255, 196, 82, 135),
    ),
  );
  }
}

