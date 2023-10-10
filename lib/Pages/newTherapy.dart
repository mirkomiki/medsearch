import 'dart:js_interop_unsafe';

import 'package:flutter/material.dart';
import 'package:medsearch/TypesOfData/therapy.dart';
import 'package:medsearch/Pages/home.dart' as home;
import 'package:medsearch/globals.dart';
class newTherapy extends StatefulWidget {
  const newTherapy({super.key});

  @override
  State<newTherapy> createState() => _newTherapyState();
}

class _newTherapyState extends State<newTherapy> {
  
  TimeOfDay time = TimeOfDay.now();
  int index = 1;
  TextEditingController nameController = TextEditingController();
  TextEditingController pillsADayController = TextEditingController();
  TextEditingController pillsInBottleController = TextEditingController();
  TextEditingController dosageController = TextEditingController();
  
  

  
  @override
  Widget build(BuildContext context) {
    final hours = time.hour.toString().padLeft(2, '0');
    final minutes = time.minute.toString().padLeft(2, '0');
      return GestureDetector(
        onTap: () {
         FocusScope.of(context).requestFocus(new FocusNode());
      },
        child: Scaffold(
              backgroundColor: Colors.grey[900],
              appBar: AppBar(
                title: const Text('Create New Therapy'),
                backgroundColor: const Color.fromARGB(255, 0, 164, 164),
              ),
              body: Form(
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: SingleChildScrollView(
                    child: 
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Padding(padding: EdgeInsets.all(10)),
                        TextFormField(
                          style: TextStyle(color: Colors.white),
                          focusNode: FocusNode(),
                          decoration: InputDecoration(
                            border: const OutlineInputBorder(),  
                            labelText: 'Enter name of therapy...', 
                            labelStyle: TextStyle(fontStyle: FontStyle.italic,color: Colors.grey[500]),
                            filled: true,
                            fillColor: const Color.fromARGB(255, 26, 26, 26)
                            ),
                            controller: nameController,
                        ),
                        Padding(padding: EdgeInsets.all(15)),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget> [
                            Flexible(
                              child: TextFormField(
                              style: TextStyle(color: Colors.white),
                              focusNode: FocusNode(),
                              decoration: InputDecoration(
                                border: const OutlineInputBorder(),  
                                labelText: 'Daily pills...', 
                                labelStyle: TextStyle(fontStyle: FontStyle.italic,color: Colors.grey[500]),
                                filled: true,
                                fillColor: const Color.fromARGB(255, 26, 26, 26)
                                ),
                                controller: pillsADayController,
                                keyboardType: TextInputType.numberWithOptions(decimal: false),
                                  ),
                              ),
                            Padding(padding: EdgeInsets.all(15)),
                            Flexible(
                              child: TextFormField(
                              style: TextStyle(color: Colors.white),  
                              focusNode: FocusNode(),
                              decoration: InputDecoration(
                                border: const OutlineInputBorder(),  
                                labelText: 'Dosage...', 
                                labelStyle: TextStyle(fontStyle: FontStyle.italic,color: Colors.grey[500]),
                                
                                filled: true,
                                fillColor: const Color.fromARGB(255, 26, 26, 26),
                                ),
                                controller: dosageController,
                                keyboardType: TextInputType.numberWithOptions(decimal: false),
                                ),
                            ),
                          ],
                        ),
                        Padding(padding: EdgeInsets.all(15)),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          
                        children: <Widget> [
                            Flexible(
                              child: TextFormField(
                              style: TextStyle(color: Colors.white),
                              focusNode: FocusNode(),
                              decoration: InputDecoration(
                                border: const OutlineInputBorder(),  
                                labelText: 'Current number of pills in bottle...', 
                                labelStyle: TextStyle(fontStyle: FontStyle.italic,color: Colors.grey[500]),
                                filled: true,
                                fillColor: const Color.fromARGB(255, 26, 26, 26)
                                ),
                                controller: pillsInBottleController,
                                keyboardType: TextInputType.numberWithOptions(decimal: false),
                                  ),
                              ),
                            

                          ],
                        ),
                        Padding(padding: EdgeInsets.all(10)),
                        
                        Row(
                          children: <Widget>[
                            Text('$hours:$minutes', style: TextStyle(fontSize: 20, color: Colors.white),),
                            Padding(padding: EdgeInsets.all(10)),
                            ElevatedButton(
                              onPressed: () async{
                                TimeOfDay? newTime = await showTimePicker(
                                  context: context, 
                                  builder: (context, child) {
                                    return Theme(data: ThemeData.dark().copyWith(
                                      dialogBackgroundColor: const Color.fromARGB(255, 32, 32, 32),
                                      
                                    ),
                                    child: child!);
                                  },
                                  initialTime: time);
                                  if(newTime == null) return;
                                  setState(() =>
                                    time = newTime);                      
                                  }, 
                              child: Text('Select other time for reminder $index')
                              ),
                          ],
                        ),
                        ElevatedButton(
                          onPressed: () {getTherapies().add(Therapy(nameController.text.toString(), dosageController.text as int, pillsADayController.text as int, pillsInBottleController.text as int),);}, 
                          child: Text('Generate')),
      
                      ],
                    ),
                  ),
                ),
              ),
            
        ),
      );
  }
}
