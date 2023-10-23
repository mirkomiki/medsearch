import "package:animated_snack_bar/animated_snack_bar.dart";
import "package:flutter/material.dart";
import "package:medsearch/TypesOfData/uploadPhotoDialog.dart";
import "package:medsearch/TypesOfData/user.dart";
import "package:medsearch/globals.dart";

class NewFamilyMemberManualy extends StatefulWidget {
  const NewFamilyMemberManualy({super.key});

  @override
  State<NewFamilyMemberManualy> createState() => _NewFamilyMemberManualyState();
}

class _NewFamilyMemberManualyState extends State<NewFamilyMemberManualy> {
  TextEditingController nameController = TextEditingController();
  TextEditingController surnameController = TextEditingController();
  TextEditingController usernameController = TextEditingController();
  TextEditingController ageController = TextEditingController();
  late String name = nameController.text.toString();
  late String username = usernameController.text.toString();
  late String surname = surnameController.text.toString();
  late int age = int.tryParse(ageController.text.toString())!;

  void finishMemberAddManually(){
    print('prolaz');
    // ignore: unnecessary_new
    localFamily.users.add(User(
      username: usernameController.text,
      name: nameController.text,
      surname: surnameController.text,
      age: int.tryParse(ageController.text) ?? 0,
      therapies: [],
    ));
    nameController = TextEditingController();
    surnameController = TextEditingController();
    usernameController = TextEditingController();
    ageController = TextEditingController();

    AnimatedSnackBar.material(
    'User Created',
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
                        TextFormField(style: const TextStyle(color: Colors.white),focusNode: FocusNode(),decoration: InputDecoration(border: const OutlineInputBorder(),  labelText: 'Username...', labelStyle: TextStyle(fontStyle: FontStyle.italic,color: Colors.grey[500]),filled: true,fillColor: const Color.fromARGB(255, 26, 26, 26)),controller: usernameController,),
                        const Padding(padding: EdgeInsets.all(15)),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          
                          children: <Widget> [
                            Flexible(
                              fit: FlexFit.loose,
                              child: TextFormField(style: const TextStyle(color: Colors.white),focusNode: FocusNode(),decoration: InputDecoration(border: const OutlineInputBorder(),  labelText: 'Name...', labelStyle: TextStyle(fontStyle: FontStyle.italic,color: Colors.grey[500]),filled: true,fillColor: const Color.fromARGB(255, 26, 26, 26)),controller: nameController,),
                              
                            ),
                            const Padding(padding: EdgeInsets.all(10)),
                            Flexible(
                              fit: FlexFit.loose,
                              child: TextFormField(style: const TextStyle(color: Colors.white),  focusNode: FocusNode(),decoration: InputDecoration(border: const OutlineInputBorder(),  labelText: 'Surname...   ', labelStyle: TextStyle(fontStyle: FontStyle.italic,color: Colors.grey[500]),filled: true,fillColor: const Color.fromARGB(255, 26, 26, 26),),controller: surnameController,),
                            ),
                            const Padding(padding: EdgeInsets.all(15)),
                            
                          ],
                        ),
                        const Padding(padding: EdgeInsets.all(15)),
                        Row(
                          children: [
                            Flexible(
                              child: TextFormField(style: const TextStyle(color: Colors.white),  focusNode: FocusNode(),decoration: InputDecoration(border: const OutlineInputBorder(),  labelText: 'Age...', labelStyle: TextStyle(fontStyle: FontStyle.italic,color: Colors.grey[500]),filled: true,fillColor: const Color.fromARGB(255, 26, 26, 26),),controller: ageController,keyboardType: const TextInputType.numberWithOptions(decimal: false),),
                            ),
                          ],
                        ),  
                        const Padding(padding: EdgeInsets.all(25)),
                        
                        ElevatedButton(
                          onPressed: () => showDialog<String>(
                            context: context, 
                            builder: (BuildContext context) => const UploadPhotoDialog(),

                          ).then((value) => setState(() => {})),
                          child: const Text('Upload photo'),
                        ),
                        
                        generateTempAvatar(),
                        ElevatedButton(onPressed: () => {finishMemberAddManually(), Navigator.of(context).pop()}, 
                        child: const Text('Save changes'),),
                        
                      ],
                      
                    ),
                  ),
                ),
              ),
            ),
        );
  }
CircleAvatar generateTempAvatar() {
  
    String fltr = '  Profile Picture \n  will';
    String sltr = 'include initals,\n  add custom picture\n     later in Settings';
    return  CircleAvatar(radius: 80,child: Text('$fltr $sltr', style: const TextStyle(fontSize: 15, ),),);
  }
  
}


