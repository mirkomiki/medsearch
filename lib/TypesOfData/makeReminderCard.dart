import 'package:flutter/material.dart';
import 'package:medsearch/globals.dart';

// ignore: must_be_immutable
class MakeReminderCard extends StatefulWidget {
  int index = 1;

  MakeReminderCard({super.key, required this.index});

  @override
  State<MakeReminderCard> createState() => _MakeReminderCardState();
}

class _MakeReminderCardState extends State<MakeReminderCard> {
  int reminderIndex = 0;

  late TimeOfDay time = TimeOfDay.now();

  @override
  Widget build(BuildContext context) {
    final hours = time.hour.toString().padLeft(2, '0');
    final minutes = time.minute.toString().padLeft(2, '0');
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
                initialTime: time);
                if(newTime == null) return;
                setState(() =>
                  time = newTime);                      
                },  
            child: Text('Change time for ${widget.index+1}. reminder'),
          ),
          const Padding(padding: EdgeInsets.all(15)),
        ],
      ),
    );
  }
} 