import 'package:flutter/material.dart';
import 'package:medsearch/Pages/fullTherapyView.dart';
import 'package:medsearch/Themes/avatars.dart';
import 'package:medsearch/TypesOfData/dailyTherapyCard.dart';
import 'package:medsearch/TypesOfData/therapy.dart';
import 'package:medsearch/globals.dart';
class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  
  
  List<Therapy> filterTherapiesForToday() {
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);
    
    final filteredTherapies = therapies.where((therapy) {
      return therapy.firstDay.day <= today.day
      && therapy.firstDay.month <= today.month
      && therapy.firstDay.year <= today.year
      && therapy.lastDay.year >= today.year
      && therapy.lastDay.month >= today.month
      && therapy.lastDay.day >= today.day;
    },).toList();
  
    return filteredTherapies;
  }
  @override
  void initState() {
    super.initState();
  }
  
  @override
  Widget build(BuildContext context) {
    final todayReminders = filterTherapiesForToday(); 
    return Scaffold(
    backgroundColor: Colors.grey[900],
    appBar: AppBar(
      title:  Image.asset('assets/rsz_transparent_logo_small.png',),
      centerTitle: true,
      backgroundColor: Colors.grey[900],
    ),
    body: 
    
    SingleChildScrollView(
      child: Column(
        children: <Widget> [
        const Divider(
          height: 20,
        ),
        
        Row(
          children: [
            
          
        
        Padding(
          padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
          child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
                child: SizedBox(
                  width: MediaQuery.of(context).size.width * 0.9,
                  height: MediaQuery.of(context).size.height * 0.14,
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    separatorBuilder: (context, index) {
                      return const SizedBox(width: 10,);
                    },
                    shrinkWrap: true,
                    itemCount: localFamily.users.length+1,
                    itemBuilder: (BuildContext context, int index) {  
                      if(index == 0){
                        return Column(
                            children: [
                              CircleAvatar(radius: 34, backgroundColor: Color.fromARGB(176, 255, 255, 255), child: Icon(Icons.group, color: Colors.grey[900],),),
                              const SizedBox(height: 5,),
                              const Text('Everyone', style: TextStyle(color: Colors.white, fontSize: 14),)
                            ],
                        );
                      }
                      return HomeAvatarCard(user: localFamily.users[index-1]);
                      
                    },
                  ),
                ),
              
            ),
          ),
        
          ],
        ),
        

        
        SingleChildScrollView(
          child: SizedBox(
            height: 420,
            child: ListView.builder(
            itemCount: todayReminders.length,
            itemBuilder: (context, index) {
              final therapy = todayReminders[index];
              return DailyTherapyCard(
                therapy: therapy,
                delete: () => 
                setState(() {
                therapies.remove(therapy);
                }),
              );
              
              },
            ),
          ),
        ),
        

        /* Column(
          children:
            therapies.map(
              (therapy) => DailyTherapyCard(
                therapy: therapy, 
                delete: () {
                setState(() {
                  therapies.remove(therapy);
                });
              })).toList(),
        ), */
        
        const Divider(
          height: 5,
        ),

        Row(
          
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          
          children: <Widget>[
            ElevatedButton(
              onPressed: () async{
                await Navigator.push(context,
              MaterialPageRoute(builder: (context) => const FullTherapy()),);
              setState(() {}); 
              }, 
              style: ButtonStyle(
                backgroundColor:MaterialStateProperty.all<Color>(Colors.amber)), 
              child: const Text(
                style: TextStyle(fontSize: 20, color: Colors.black),
                'See full therapy')
            ),
            
            ElevatedButton.icon(
              onPressed: () async{
                await Navigator.pushNamed(context, '/reminders' );
                setState(() {});
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