import 'package:flutter/material.dart';
import 'package:medsearch/Pages/newTherapy.dart';
import 'package:medsearch/Pages/settings.dart';
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
    appBar: AppBar(
      title: const Text('Smart therapy tracker'),
      centerTitle: true,
      backgroundColor: const Color.fromARGB(255, 196, 82, 135),
    ),
    body: 
    
    SingleChildScrollView(
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
              onPressed: () {
                Navigator.pushNamed(context, '/full-therapy'); 
              }, 
              style: ButtonStyle(
                backgroundColor:MaterialStateProperty.all<Color>(Colors.amber)), 
              child: const Text(
                style: TextStyle(fontSize: 20, color: Colors.black),
                'See full therapy')
            ),
            
            ElevatedButton.icon(
              onPressed: () {
                Navigator.pushNamed(context, '/reminders');
                },
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
 
  );
  }
}