/* import 'package:flutter/material.dart';
import 'package:medsearch/globals.dart';

// ignore: must_be_immutable
class MakeReminderCard extends StatefulWidget {

  MakeReminderCard({super.key});
  reminderList = therapies.elementAt(index).timeToTake;
  @override
  State<MakeReminderCard> createState() => _MakeReminderCardState();
}

class _MakeReminderCardState extends State<MakeReminderCard> {
  int reminderIndex = 0;
  
  


  @override
  Widget build(BuildContext context) {
    final hours = reminderList.elementAt(reminderIndex).hour.toString().padLeft(2, '0');
      final minutes = reminderList.elementAt(reminderIndex).minute.toString().padLeft(2, '0');  
    if(reminderList.isNotEmpty){
      final hours = TimeOfDay.now().hour.toString().padLeft(2, '0');
      final minutes = TimeOfDay.now().minute.toString().padLeft(2, '0');
    } 
      
    
    
    return IntrinsicHeight(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Padding(padding: EdgeInsets.all(15)),
          Expanded(flex: 1,child: Text('$hours:$minutes', style: const TextStyle(fontSize: 20, color: Colors.white),)),
          const Padding(padding: EdgeInsets.all(15)),
          ElevatedButton(
            onPressed: () async{
              TimeOfDay? newTime = await showTimePicker(
                context: context, 
                builder: (context, child) {
                  return Theme(data: ThemeData.dark().copyWith(
                    dialogBackgroundColor: const Color.fromARGB(255, 32, 32, 32),
                    
                  ),
                  child: child!);
                },
                initialTime: reminderList.elementAt(reminderIndex));
                if(newTime == null) return;
                setState(() => {
                  
                  reminderList.add(newTime),
                  setTherapiesReminder(reminderIndex, reminderList),
                  

                  },
                  );                      
                },  
            child: Text('Change time for reminder'),
          ),
          const Padding(padding: EdgeInsets.all(15)),
        ],
      ),
    );
  }
}  */