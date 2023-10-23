import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:flutter/material.dart';
import 'package:medsearch/SettingsPages/addFamilyMember.dart';
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
  bool addMainUser = true;
  
  @override
  void initState() {
    super.initState();
    nameController.text = localFamily.familyName;
  }
  
  void finishFamilyEdit() {
    if(addMainUser == true){
      localFamily.users.add(localUser);
    } else {
      localFamily.users = [];
    }
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
                edit: () {
                  setState(() {
                    
                  });
                },
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
                    ElevatedButton(onPressed: () => {finishFamilyEdit(), Navigator.of(context).pop()}, 
                    child: const Text('Save Changes'),),
                  ],
                ),
              ),
            ),
          ),
          floatingActionButton: FloatingActionButton(
              onPressed: () async{
                await Navigator.push(context,
              MaterialPageRoute(builder: (context) => const AddFamilyMember()),);
              setState(() {});
            }),
        ),
    );
  }
}

