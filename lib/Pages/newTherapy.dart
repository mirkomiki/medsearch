import 'dart:html';

import 'package:flutter/material.dart';

class newTherapy extends StatefulWidget {
  const newTherapy({super.key});

  @override
  State<newTherapy> createState() => _newTherapyState();
}

class _newTherapyState extends State<newTherapy> {
  
  TimeOfDay time = TimeOfDay.now();
  int index = 1;
  TextEditingController nameController = TextEditingController();
  TextEditingController numbersDayController = TextEditingController();
  TextEditingController pillsInBottleController = TextEditingController();
  


  @override
  Widget build(BuildContext context) {
    final hours = time.hour.toString().padLeft(2, '0');
    final minutes = time.minute.toString().padLeft(2, '0');
      return Scaffold(
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
                      TextFormField(
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
                      Row(
                        children: <Widget> [
                        TextFormField(
                          focusNode: FocusNode(),
                          decoration: InputDecoration(
                              border: const OutlineInputBorder(),  
                              labelText: 'How many pills a day', 
                              labelStyle: TextStyle(fontStyle: FontStyle.italic,color: Colors.grey[500]),
                              filled: true,
                              fillColor: const Color.fromARGB(255, 26, 26, 26)
                            ),
                          controller: numbersDayController,
                          keyboardType: const TextInputType
                          .numberWithOptions(decimal: false),
                          ),
                        
                        ],
                      ),

                      Text('$hours:$minutes'),
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
                        child: Text('Select time for reminder $index')
                        ),

                    ],
                  ),
                ),
              ),
            ),
          
      );
  }
}