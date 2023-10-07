import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:flutter/material.dart';
import 'therapy.dart';
class DailyTherapyCard extends StatelessWidget {
  final Function() delete;
  final Therapy therapy;
  const DailyTherapyCard({super.key,  required this.therapy, required this.delete});
  
  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30),
      ),
      shadowColor: Colors.black,
      surfaceTintColor: Colors.amber,
      color: const Color.fromARGB(255, 188, 123, 224),
      margin: const EdgeInsets.fromLTRB(0, 0, 0, 10),
      child:
      
      Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Text(
            'Take: ${therapy.name}', 
            style: const TextStyle(color: Colors.black, fontSize: 20),),
            Text('Dosage:${therapy.dosage}',
            style: const TextStyle(color: Colors.black, fontSize: 20),),
            Text('Remaning pills:${therapy.pillsAvaliable}',
            style: const TextStyle(color: Colors.black, fontSize: 20),),
            const Text('When:',
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
                  icon: const Icon(Icons.done),
                  onPressed: () {
                      
                      AnimatedSnackBar.rectangle(
                      'Success',
                      'Taken therapy',
                      type: AnimatedSnackBarType.success,
                      brightness: Brightness.dark,
                      mobileSnackBarPosition: MobileSnackBarPosition.bottom,
                      ).show(context);
                  },
                  
                  label: const Text('DONE', style: TextStyle(color: Color.fromARGB(255, 255, 255, 255)),)
                  ),
                const SizedBox(width: 5,),
                
                ElevatedButton.icon(
                  style: 
                    ButtonStyle(
                      backgroundColor:MaterialStateProperty.all<Color>(Colors.red),
                      iconColor: MaterialStateProperty.all<Color>(Colors.white),
                    ),
                  icon: const Icon(Icons.do_disturb_on_outlined),
                  onPressed: () {AnimatedSnackBar.rectangle(
                      'Warning: Ignore',
                      'Are you sure you want to ignore this reminder?',
                      type: AnimatedSnackBarType.warning,
                      brightness: Brightness.dark,
                      mobileSnackBarPosition: MobileSnackBarPosition.bottom,
                      ).show(context);
                      
                      },
                  
                  label: const Text('Ignore', style: TextStyle(color: Color.fromARGB(255, 255, 255, 255)),)
                ),
                IconButton(
                  onPressed: () =>
                      onDeleteButtonPressed(context), 
                      
                      
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
    delete();
    AnimatedSnackBar.rectangle(
    'Warning: Deleted',
    'Do you want to undo changes', //Later fix dona il neko ce to neams, no time to dye
    type: AnimatedSnackBarType.warning,
    brightness: Brightness.dark,
    mobileSnackBarPosition: MobileSnackBarPosition.bottom,
    ).show(context);
    }
    
}