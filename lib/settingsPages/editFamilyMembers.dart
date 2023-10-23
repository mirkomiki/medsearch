import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:flutter/material.dart';
import 'package:medsearch/Pages/TimePickerWidget.dart';
import 'package:medsearch/Pages/newTherapy.dart';
import 'package:medsearch/TypesOfData/therapy.dart';
import 'package:medsearch/TypesOfData/uploadDialogFamilyUser.dart';
import 'package:medsearch/TypesOfData/uploadPhotoDialog.dart';
import 'package:medsearch/TypesOfData/user.dart';

// ignore: must_be_immutable
class EditFamilyMember extends StatefulWidget {
  User user;
  EditFamilyMember({super.key, required this.user});
  @override
  State<EditFamilyMember> createState() => _EditFamilyMemberState(
  );
}

class _EditFamilyMemberState extends State<EditFamilyMember> {
  TextEditingController nameController = TextEditingController();
  TextEditingController surnameController = TextEditingController();
  TextEditingController usernameController = TextEditingController();
  TextEditingController ageController = TextEditingController();
 
  @override
  void initState() {
    super.initState();
    nameController.text = widget.user.name.toString();
    surnameController.text = widget.user.surname.toString();
    usernameController.text = widget.user.username.toString();
    ageController.text = widget.user.age.toString();
  }
  void finishUserAccountEdit(){
    widget.user.name = nameController.text;
    widget.user.surname = surnameController.text;
    widget.user.username = usernameController.text;
    widget.user.age = int.tryParse(ageController.text.toString());
    
    Navigator.pop(context);
    setState(() {});
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
                        ElevatedButton(onPressed: () => {finishUserAccountEdit(),}, 
                        child: const Text('Save changes'),),
                        
                        
                        ElevatedButton(
                          onPressed: () => showDialog<String>(
                            context: context, 
                            builder: (BuildContext context) => UploadPhotoFamilyDialog(user: widget.user),
                          ).then((value) => setState(() => {})),
                          child: const Text('Upload photo'),
                        ),
                      ],
                      
                    ),
                  ),
                ),
              ),
            ),
        );
  }
}

//CREDIT TO CHATGPT == GRESKA JE BIO MOJ UPIS NA RACUNARSTVO