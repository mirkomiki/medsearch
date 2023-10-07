import 'package:flutter/material.dart';
import 'package:medsearch/dailyTherapyCard.dart';
import 'package:medsearch/therapy.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  List<Therapy> therapies = [
    Therapy('Sinersul', 500, 1, 20),
    Therapy('Brufen', 1000, 2, 40),
    Therapy('Redbull', 330, 1, 1)
  ];

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
      backgroundColor: const Color.fromARGB(255, 26, 26, 26),
      unselectedItemColor: const Color.fromARGB(129, 255, 255, 255),
      selectedItemColor: Colors.white,
    ),
    
    appBar: AppBar(
      title: const Text('Smart therapy tracker'),
      centerTitle: true,
      backgroundColor: const Color.fromARGB(255, 196, 82, 135),
    ),
    body: SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget> [
        const Divider(
          height: 20,
        ),
        const SingleChildScrollView(scrollDirection: Axis.horizontal,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
            CircleAvatar(radius: 36, backgroundImage: AssetImage('assets/scary_man.jpg', )),
            CircleAvatar(radius: 36, backgroundImage: AssetImage('assets/scary_man.jpg', )),
            CircleAvatar(radius: 36, backgroundImage: AssetImage('assets/scary_man.jpg', )),
            CircleAvatar(radius: 36, backgroundImage: AssetImage('assets/baby.jpg', )),
            CircleAvatar(radius: 36, backgroundImage: AssetImage('assets/trump_avatar.jpg', )),
            CircleAvatar(radius: 36, backgroundImage: AssetImage('assets/scary_man.jpg', )),
            ],
          ),
        ),
        Divider(
          height: 25,
          color: Colors.grey[900],
        ),
        Column(
          children:
            therapies.map(
              (therapy) => DailyTherapyCard(
                therapy: therapy, 
                delete: () {
                setState(() {
                  therapies.remove(therapy);
                });
              })).toList(),
        ),
        
        
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            ElevatedButton(
              onPressed: () {}, 
              style: ButtonStyle(
                backgroundColor:MaterialStateProperty.all<Color>(Colors.amber)), 
              child: const Text(
                style: TextStyle(fontSize: 20, color: Colors.black),
                'See full therapy')
            ),
            
            ElevatedButton.icon(
              onPressed: () {},
              icon: const Icon( 
              Icons.add_alert_rounded,
              size: 24.0,
              ),
              label: const Text(style: TextStyle(fontSize: 20),'Remind me', selectionColor: Colors.white,),
              style: ButtonStyle(
                backgroundColor:MaterialStateProperty.all<Color>(const Color.fromARGB(255, 196, 82, 135)),
                
                )
            ),
          ],
        ),
      ],
      ),
    ),
 
    floatingActionButton: FloatingActionButton(
      onPressed: () {},
      backgroundColor: const Color.fromARGB(255, 196, 82, 135),
      child: const Icon(Icons.add,
      size: 36,
      ),
    ),
  );
  }
}



