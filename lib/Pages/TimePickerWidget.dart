import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:medsearch/globals.dart';

class TimePickerWidget extends StatelessWidget {
  final TimeOfDay timeOfDay;
  final ValueChanged<TimeOfDay> onChanged;
  
  int indexTherapy;

 TimePickerWidget({required this.timeOfDay, required this.onChanged, required this.indexTherapy});
  
  @override
  Widget build(BuildContext context) {
   
    return ListTile(
      title: Text('Reminder ${timeOfDay.hour}:${timeOfDay.minute}'),
      trailing: ElevatedButton(
        onPressed: () async {
          final selectedTime = await showTimePicker(
            context: context,
            initialTime: timeOfDay,
          );
          if (selectedTime != null) {
            onChanged(selectedTime);
            therapies.elementAt(indexTherapy).timeToTake.add(selectedTime);
          }
        },
        child: const Text('Change Time'),
      ),
      
    );
    
  }
}
