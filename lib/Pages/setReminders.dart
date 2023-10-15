/* import 'package:flutter/material.dart';
import 'package:medsearch/Pages/pages.dart';
import 'package:medsearch/TypesOfData/makeReminderCard.dart';

// ignore: must_be_immutable
class SetReminders extends StatelessWidget {
  int listSize;
  SetReminders({super.key, required this.listSize});
  List<TimeOfDay> reminderList = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      backgroundColor: Colors.grey[900],
      appBar: AppBar(
        title: const Text('Set Reminders'),
        backgroundColor: const Color.fromARGB(255, 0, 164, 164),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ListView.builder(
              shrinkWrap: true,
              itemCount: listSize, 
              itemBuilder: (context, index) {
                MakeReminderCard();
                
              },
            ),
            
            ElevatedButton(
              onPressed: () {   
                    //vratiti u finish therapy ako bude problema
                
              }, 
              child: const Text('NEXT')),
            ],
          
          
      
        ),
      ),
    );
  }
} */