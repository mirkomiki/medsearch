import "package:animated_snack_bar/animated_snack_bar.dart";
import "package:flutter/material.dart";
import "package:medsearch/TypesOfData/uploadPhotoDialog.dart";
import "package:medsearch/globals.dart";

class UserEdit extends StatefulWidget {
  const UserEdit({super.key});

  @override
  State<UserEdit> createState() => _UserEditState();
}

class _UserEditState extends State<UserEdit> {
  TextEditingController nameController = TextEditingController();
  TextEditingController surnameController = TextEditingController();
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController ageController = TextEditingController();
  @override
  void initState() {
    super.initState();
    nameController.text = localUser.name;
    surnameController.text = localUser.surname;
    usernameController.text = localUser.username;
    ageController.text = localUser.age.toString();
    
  }
  void finishUserAccountEdit(){
    
    localUser.age = int.tryParse(ageController.text.toString());
    localUser.name = nameController.text.toString();
    localUser.surname = surnameController.text.toString();
    localUser.username = usernameController.text.toString();

    
    /* selectedPageIndex = 2;
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const Pages()),
    ); */
    AnimatedSnackBar.material(
    'Changes saved',
    //Later fix dona il
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
                        ElevatedButton(onPressed: () => {finishUserAccountEdit(), Navigator.of(context).pop()}, 
                        child: const Text('Save changes'),),
                        localUser.avatar,
                        
                        
                        ElevatedButton(
                          onPressed: () => showDialog<String>(
                            context: context, 
                            builder: (BuildContext context) => const UploadPhotoDialog(),

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