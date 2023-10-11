
import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:flutter/material.dart';
import 'therapy.dart';
class infoTherapyCard extends StatelessWidget {
  final Function() delete;
  final Function() edit;
  final Therapy therapy;
  const infoTherapyCard({super.key,  required this.therapy, required this.delete, required this.edit});
  
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
                      backgroundColor:MaterialStateProperty.all<Color>(Colors.amber),
                      iconColor: MaterialStateProperty.all<Color>(Colors.grey[700]!),
                    ),
                  icon: const Icon(Icons.done),
                  onPressed: () => onEditButtonPressed(context),
                  
                  label: const Text('EDIT', style: TextStyle(color: Colors.grey),)
                  ),
                const SizedBox(width: 5,),

                IconButton(
                  onPressed: () =>
                      onDeleteButtonPressed(context),  
                  icon: Icon(Icons.delete, color: Colors.grey[700]), 
                ),
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

    void onEditButtonPressed(BuildContext context){
      edit();
    }
    
}