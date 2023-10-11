

import 'package:flutter/material.dart';
import 'package:medsearch/TypesOfData/therapy.dart';
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
  late String name = nameController.text;
  late int? pillsADay = int.tryParse(pillsADayController.text);
  late int? dosage = int.tryParse(dosageController.text);
  late int? pillsInBottle= int.tryParse(pillsInBottleController.text);
  void finishAddTherapy(){
      therapies.add(Therapy(name, dosage, pillsADay, pillsInBottle));
      // ignore: avoid_print
      
      nameController = TextEditingController();
      pillsADayController = TextEditingController();
      pillsInBottleController = TextEditingController();
      dosageController = TextEditingController();

  }

  
  @override
  Widget build(BuildContext context) {
    final hours = time.hour.toString().padLeft(2, '0');
    final minutes = time.minute.toString().padLeft(2, '0');
      return GestureDetector(
        onTap: () {
         FocusScope.of(context).requestFocus(FocusNode());
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
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        const Padding(padding: EdgeInsets.all(10)),
                        TextFormField(
                          style: const TextStyle(color: Colors.white),
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
                        const Padding(padding: EdgeInsets.all(15)),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget> [
                            Flexible(
                              child: TextFormField(
                              style: const TextStyle(color: Colors.white),
                              focusNode: FocusNode(),
                              decoration: InputDecoration(
                                border: const OutlineInputBorder(),  
                                labelText: 'Daily pills...', 
                                labelStyle: TextStyle(
                                    fontStyle: FontStyle.italic,color: Colors.grey[500]),
                                filled: true,
                                fillColor: const Color.fromARGB(255, 26, 26, 26)
                                ),
                                controller: pillsADayController,
                                keyboardType: const TextInputType.numberWithOptions(decimal: false),
                                  ),
                              ),
                            const Padding(padding: EdgeInsets.all(15)),
                            Flexible(
                              child: TextFormField(
                              style: const TextStyle(color: Colors.white),  
                              focusNode: FocusNode(),
                              decoration: InputDecoration(
                                border: const OutlineInputBorder(),  
                                labelText: 'Dosage...', 
                                labelStyle: TextStyle(fontStyle: FontStyle.italic,color: Colors.grey[500]),
                                filled: true,
                                fillColor: const Color.fromARGB(255, 26, 26, 26),
                                ),
                                controller: dosageController,
                                keyboardType: const TextInputType.numberWithOptions(decimal: false),
                                ),
                            ),
                          ],
                        ),
                        const Padding(padding: EdgeInsets.all(15)),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          
                        children: <Widget> [
                            Flexible(
                              child: TextFormField(
                              style: const TextStyle(color: Colors.white),
                              focusNode: FocusNode(),
                              decoration: InputDecoration(
                                border: const OutlineInputBorder(),  
                                labelText: 'Current number of pills in bottle...', 
                                labelStyle: TextStyle(fontStyle: FontStyle.italic,color: Colors.grey[500]),
                                filled: true,
                                fillColor: const Color.fromARGB(255, 26, 26, 26)
                                ),
                                controller: pillsInBottleController,
                                keyboardType: const TextInputType.numberWithOptions(decimal: false),
                                  ),
                              ),
                            

                          ],
                        ),
                        const Padding(padding: EdgeInsets.all(10)),
                        
                        Row(
                          children: <Widget>[
                            Text('$hours:$minutes', style: const TextStyle(fontSize: 20, color: Colors.white),),
                            const Padding(padding: EdgeInsets.all(10)),
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
                          onPressed: () {finishAddTherapy();}, 
                          child: const Text('Finish')),
      
                      ],
                    ),
                  ),
                ),
              ),
            
        ),
      );
  }
}
