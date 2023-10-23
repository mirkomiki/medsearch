import 'dart:math';

import 'package:flutter/material.dart';
import 'package:medsearch/Pages/fullTherapyView.dart';
import 'package:medsearch/Pages/pages.dart';
import 'package:medsearch/TypesOfData/Themes/avatars.dart';
import 'package:medsearch/TypesOfData/dailyTherapyCard.dart';
import 'package:medsearch/TypesOfData/therapy.dart';
import 'package:medsearch/TypesOfData/user.dart';
import 'package:medsearch/globals.dart';
class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  
  int selectedPerson = 0;
  List<Therapy> filterTherapiesForToday(List<Therapy> ctherapies) {
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);
    
    


    final filteredTherapies = ctherapies.where((therapy) {
      return therapy.firstDay.day <= today.day
      && therapy.firstDay.month <= today.month
      && therapy.firstDay.year <= today.year
      && therapy.lastDay.year >= today.year
      && therapy.lastDay.month >= today.month
      && therapy.lastDay.day >= today.day;
    },).toList();
    return filteredTherapies;
  }
  Row genRow(selectedPerson){
      if(selectedPerson == 101){
        return const Row(children: [
          Padding(
            padding: EdgeInsets.fromLTRB(15, 8, 8, 8),
            child: Text("Everyone's therapy: ", style: TextStyle(fontSize: 18, color: Colors.white),),
          ),
        ],);
      } else {
        return Row(children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(15, 8, 8, 8),
            child: Text("${localFamily.users[selectedPerson].name}'s therapy: ", style: TextStyle(fontSize: 18, color: Colors.white),),
          ),
        ],);
      }
    }
  late List<Therapy> todayReminders = [];
  
  List<Therapy> familyTherapy = [];
  void updateTodayReminders(int sIndex){
    familyTherapy = [];
    if(localFamily.users.isEmpty){
      familyTherapy = localUser.therapies;
    } else {
      for (User user in localFamily.users) {
        familyTherapy.addAll(user.therapies);
      }
    }
    if(sIndex == 0){
      setState(() {
        todayReminders = familyTherapy;
      });
    } else{
      setState(() {
        todayReminders = localFamily.users[sIndex].therapies;
      }); 
    }
  }
  @override
  void initState() {
    super.initState();
    updateTodayReminders(0);
    
  }
  
  @override
  Widget build(BuildContext context) {
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
                        return InkWell(
                          onTap: () {
                            setState(() {
                              updateTodayReminders(0);
                              selectedPerson = 101;
                            });
                            
                          },
                          radius: 35,
                          child: Column(
                            children: [
                              CircleAvatar(radius: 34, backgroundColor: const Color.fromARGB(176, 255, 255, 255), child: Icon(Icons.group, color: Colors.grey[900],),),
                              const SizedBox(height: 5,),
                              const Text('Everyone', style: TextStyle(color: Colors.white, fontSize: 14),)
                            ],
                          ),
                        );
                      }
                      return InkWell(
                      onTap: () {
                        setState(() {
                          todayReminders = filterTherapiesForToday(localFamily.users[index-1].therapies);
                          selectedPerson = index-1;
                        });
                      },
                      radius: 35,
                      child: HomeAvatarCard(user: localFamily.users[index-1]));
                    },
                  ),
                ),
            ),
          ),
          ],
        ),
        genRow(selectedPerson),
        const SizedBox(height: 5,),
        SingleChildScrollView(
          child: SizedBox(
            height: 420,
            child: ListView.builder(
            itemCount: todayReminders.length+1,
            itemBuilder: (context, index) {
              
              if(index == 0){
                if(todayReminders.isEmpty){
                  return Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(35),
                        ),
                        shadowColor: Colors.black,
                        surfaceTintColor: Colors.amber,
                        color: const Color.fromARGB(255, 201, 206, 213),
                        margin: const EdgeInsets.fromLTRB(10, 0, 10, 10),
                        child:
                          Padding(
                            padding: const EdgeInsets.all(10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                const Text('No reminders soon\nCreate new therapy if needed'),
                                const SizedBox(width: 10,),
                                ElevatedButton.icon(onPressed: () {
                                  selectedPageIndex = 1;
                                  Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(builder: (context) => const Pages()),
                                  );}, icon: const Icon(Icons.add), label: const Text('ADD', style: TextStyle(fontSize: 12),),),
                              ],
                            ),
                          ),
                        );
                      
                } else {
                  return Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(35),
                      ),
                      shadowColor: Colors.black,
                      surfaceTintColor: Colors.amber,
                      color: const Color.fromARGB(255, 201, 206, 213),
                      margin: const EdgeInsets.fromLTRB(10, 0, 10, 10),
                      child:
                        Padding(
                          padding: const EdgeInsets.all(10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              const Text('Create new therapy if needed'),
                              const SizedBox(width: 10,),
                              ElevatedButton.icon(onPressed: () {selectedPageIndex = 1;
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(builder: (context) => const Pages()),
                              );}, icon: const Icon(Icons.add), label: const Text('ADD', style: TextStyle(fontSize: 12),),),
                            ],
                          ),
                        ),
                  );
                }
              } else {
                final therapy = todayReminders[index-1];
                return DailyTherapyCard(
                therapy: therapy,
                delete: () => 
                setState(() {
                  
                therapies.remove(therapy);
                }),
              );
              }
              
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