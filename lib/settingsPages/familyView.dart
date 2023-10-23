import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:flutter/material.dart';
import 'package:medsearch/SettingsPages/addFamilyMember.dart';
import 'package:medsearch/SettingsPages/editFamilyMembers.dart';
import 'package:medsearch/TypesOfData/family.dart';
import 'package:medsearch/TypesOfData/userCard.dart';
import 'package:medsearch/globals.dart';

class EditFamily extends StatefulWidget {
  const EditFamily({super.key});

  @override
  State<EditFamily> createState() => _EditFamilyState();
}

class _EditFamilyState extends State<EditFamily> {
  TextEditingController nameController = TextEditingController();
  
  @override
  void initState() {
    super.initState();
    nameController.text = localFamily.familyName;
    
  }
  
  void finishFamilyEdit() {
    Navigator.pop(context);
    setState(() {
      
    });
    AnimatedSnackBar.material(
      'Changes saved',
      type: AnimatedSnackBarType.success,
      mobileSnackBarPosition: MobileSnackBarPosition.bottom,
      ).show(context);
  }
  @override
  Widget build(BuildContext context) {
    
    return GestureDetector(
        onTap: () {
         FocusScope.of(context).requestFocus(FocusNode());
      },
        child: Scaffold(
              backgroundColor: Colors.grey[900],
              appBar: AppBar(
                title: const Text('User Account'),
                backgroundColor: const Color.fromARGB(255, 0, 164, 164),
              ),
              body: Form(
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: SingleChildScrollView(
                    child: 
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        const Padding(padding: EdgeInsets.all(10)),
                        TextFormField(style: const TextStyle(color: Colors.white),focusNode: FocusNode(),decoration: InputDecoration(border: const OutlineInputBorder(),  labelText: 'Family name...', labelStyle: TextStyle(fontStyle: FontStyle.italic,color: Colors.grey[500]),filled: true,fillColor: const Color.fromARGB(255, 26, 26, 26)),controller: nameController,),
                        const Padding(padding: EdgeInsets.all(15)),
                        const Padding(padding: EdgeInsets.all(25)),
                        SingleChildScrollView(
          child: SizedBox(
            height: 420,
            child: ListView.builder(
            itemCount: localFamily.users.length,
            itemBuilder: (context, index) {
              final user = localFamily.users[index];
              return UserCard(
                edit: () => Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => EditFamilyMember(user: user,), // selectedTherapy is the therapy object to edit
                    ),
                  ).then((updatedUser) {
                    if (updatedUser != null) {
                      // Find the index of the therapy in the list
                      int index = localFamily.users.indexOf(user);
                      if (index != -1) {
                        // Update the therapy object in the list with the updated one
                        setState(() {
                          localFamily.users[index] = updatedUser;
                        });
                      }
                    }
                  }).then((value) => setState(() => {})),
                delete: () => 
                  setState(() {
                    localFamily.users.remove(user);
                  }), 
                user: user,
              );
              
              },
            ),
          ),
        ),
                    ElevatedButton(onPressed: () => {finishFamilyEdit()}, 
                    child: const Text('Save Changes'),),
                  ],
                ),
              ),
            ),
          ),
          floatingActionButton: FloatingActionButton(
              backgroundColor: Colors.grey,
              onPressed: () async{
                await Navigator.push(context,
              MaterialPageRoute(builder: (context) => const AddFamilyMember()),);
              setState(() {});
            },
            child: const Icon(Icons.add, size: 30,)),
        ),
    );
  }
}

