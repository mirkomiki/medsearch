import 'dart:js_util';
import 'dart:ui';
import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'therapy.dart';
class DailyTherapyCard extends StatelessWidget {
  final Function() delete;
  final Therapy therapy;
  DailyTherapyCard({ required this.therapy, required this.delete});
  
  @override
  Widget build(BuildContext context) {
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
            'Take: ${therapy.name}', 
            style: TextStyle(color: Colors.black, fontSize: 20),),
            Text('Dosage:${therapy.dosage}',
            style: TextStyle(color: Colors.black, fontSize: 20),),
            Text('Remaning pills:${therapy.pillsAvaliable}',
            style: TextStyle(color: Colors.black, fontSize: 20),),
            Text('When:',
            style: TextStyle(color: Colors.black, fontSize: 20),),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                ElevatedButton.icon(
                
                  style: 
                    ButtonStyle(
                      backgroundColor:MaterialStateProperty.all<Color>(Colors.green),
                      iconColor: MaterialStateProperty.all<Color>(Colors.white),
                    ),
                  icon: Icon(Icons.done),
                  onPressed: () {
                      
                      AnimatedSnackBar.rectangle(
                      'Success',
                      'Taken therapy',
                      type: AnimatedSnackBarType.success,
                      brightness: Brightness.dark,
                      mobileSnackBarPosition: MobileSnackBarPosition.bottom,
                      ).show(context);
                  },
                  
                  label: Text('DONE', style: TextStyle(color: Color.fromARGB(255, 255, 255, 255)),)
                  ),
                SizedBox(width: 5,),
                
                ElevatedButton.icon(
                  style: 
                    ButtonStyle(
                      backgroundColor:MaterialStateProperty.all<Color>(Colors.red),
                      iconColor: MaterialStateProperty.all<Color>(Colors.white),
                    ),
                  icon: Icon(Icons.do_disturb_on_outlined),
                  onPressed: () {onDeleteButtonPressed(context);},
                  
                  label: Text('Ignore', style: TextStyle(color: Color.fromARGB(255, 255, 255, 255)),)
                ),
                IconButton(
                  onPressed:() {
                    delete;
                  AnimatedSnackBar.rectangle(
                      'Warning: Delete',
                      'Are you sure you want to delete this reminder?',
                      type: AnimatedSnackBarType.warning,
                      brightness: Brightness.dark,
                      mobileSnackBarPosition: MobileSnackBarPosition.bottom,
                      ).show(context);
                      
                      },
                icon: Icon(Icons.delete, color: Colors.grey[700]), ),
              ],
            )
          ],
        ),
      ),
    );
  }



    //Functions
    void onDeleteButtonPressed(BuildContext context){
    delete;
    AnimatedSnackBar.rectangle(
    'Warning: Delete',
    'Are you sure you want to delete this reminder?',
    type: AnimatedSnackBarType.warning,
    brightness: Brightness.dark,
    mobileSnackBarPosition: MobileSnackBarPosition.bottom,
    ).show(context);
    }
}