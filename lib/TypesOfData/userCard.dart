import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:flutter/material.dart';
import 'package:medsearch/TypesOfData/therapy.dart';
import 'package:medsearch/TypesOfData/user.dart';
import 'package:medsearch/globals.dart';

class UserCard extends StatelessWidget {
  

  const UserCard({super.key, required this.delete, required this.edit, required this.user});
  final Function() delete;
  final Function() edit;
  final User user;

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
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
      
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CircleAvatar(radius: 35,child: user.avatar,),
                  ],
                  
                ),
                const SizedBox(width: 20,),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment:CrossAxisAlignment.start ,
                  children: [
                    Text(
                    '${user.name} ${user.surname}', 
                    style: const TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),),
                    Text('Username: ${user.username}',
                    style: const TextStyle(color: Colors.black, fontSize: 16),),
                    Text('Age: ${user.age}',
                    style: const TextStyle(color: Colors.black, fontSize: 16),),
                  
                  ],
                ),
                
              ],
            ),
            Row(
               mainAxisAlignment: MainAxisAlignment.end,
               
               children: [
                ElevatedButton.icon(
                
                  style: 
                    ButtonStyle(
                      backgroundColor:MaterialStateProperty.all<Color>(Colors.amber),
                      iconColor: MaterialStateProperty.all<Color>(Colors.grey[700]!),
                    ),
                  icon: const Icon(Icons.edit),
                  onPressed: () => onEditButtonPressed(context),
                  
                  label: const Text('EDIT', style: TextStyle(color: Colors.grey),)
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
  
  void onDeleteButtonPressed(BuildContext context) {
    delete();
    AnimatedSnackBar.material(
      'Warning: Deleted',
      //Later fix dona il neko ce to neams, no time to dye
      type: AnimatedSnackBarType.warning,
      mobileSnackBarPosition: MobileSnackBarPosition.bottom,
      ).show(context);
  }
  
  void onEditButtonPressed(BuildContext context) {
    edit();
  }
}
