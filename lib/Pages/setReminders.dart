import 'package:flutter/material.dart';
import 'package:medsearch/Pages/pages.dart';
import 'package:medsearch/TypesOfData/makeReminderCard.dart';

// ignore: must_be_immutable
class SetReminders extends StatelessWidget {
  int listSize;
  SetReminders({super.key, required this.listSize});
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      backgroundColor: Colors.grey[900],
      appBar: AppBar(
        title: const Text('Set Reminders'),
        backgroundColor: const Color.fromARGB(255, 0, 164, 164),
      ),
      body: Column(
        children: [
          ListView.builder(
            shrinkWrap: true,
            itemCount: listSize, 
            itemBuilder: (context, index) => MakeReminderCard(index: index),
            
          ),
          ElevatedButton(
            onPressed: () {       //vratiti u finish therapy ako bude problema
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const Pages()),
                  );

            }, 
            child: const Text('NEXT')),
          ],
        
        

      ),


    );
  }
}