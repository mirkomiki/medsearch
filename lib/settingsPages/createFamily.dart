import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:flutter/material.dart';
import 'package:medsearch/TypesOfData/family.dart';
import 'package:medsearch/globals.dart';

class CreateFamily extends StatefulWidget {
  const CreateFamily({super.key});

  @override
  State<CreateFamily> createState() => _CreateFamilyState();
}

class _CreateFamilyState extends State<CreateFamily> {
  TextEditingController nameController = TextEditingController();
  bool addMainUser = true;
  
  @override
  void initState() {
    super.initState();
    if(localFamily.familyName.isEmpty == false){
      AnimatedSnackBar.material(
      'Family allready created',
      type: AnimatedSnackBarType.info,
      mobileSnackBarPosition: MobileSnackBarPosition.bottom,
      ).show(context); 
      Navigator.of(context).pop();
    } else {
      nameController.text = localFamily.familyName;
    }
  }
  
  void finishFamilyCreate() {
    localFamily = Family(familyName: nameController.text.toString(), users: []);
    if(addMainUser == true){
      localFamily.users.add(localUser);
    } else {
      localFamily.users= [];
    }
    print(localFamily.users.length);
    AnimatedSnackBar.material(
      'Created family',
      type: AnimatedSnackBarType.success,
      mobileSnackBarPosition: MobileSnackBarPosition.bottom,
      ).show(context);
  }
  @override
  Widget build(BuildContext context) {
    bool sValue = true;
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
                        TextFormField(style: const TextStyle(color: Colors.white),focusNode: FocusNode(),decoration: InputDecoration(border: const OutlineInputBorder(),  labelText: 'Username...', labelStyle: TextStyle(fontStyle: FontStyle.italic,color: Colors.grey[500]),filled: true,fillColor: const Color.fromARGB(255, 26, 26, 26)),controller: nameController,),
                        const Padding(padding: EdgeInsets.all(15)),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              addMainUser = !addMainUser;
                            });
                          },
                          child: CheckboxListTile(
                            
                            title: const Text('Include my account in this family', style: TextStyle(color: Colors.white),),
                            
                            value: addMainUser, 
                            onChanged: (bool? value) =>{
                            setState(() {
                              addMainUser = value!;
                            })
                            },
                          ),
                        ),
                        
                        
                        const Padding(padding: EdgeInsets.all(25)),
                        ElevatedButton(onPressed: () => {finishFamilyCreate(), Navigator.of(context).pop()}, 
                        child: const Text('Create'),),
                        
                        
                        
                        
                      ],
                      
                    ),
                  ),
                ),
              ),
            ),
        );
  }
}

