

import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:medsearch/Pages/home.dart';
import 'package:medsearch/TypesOfData/therapy.dart';
import 'package:medsearch/globals.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

class newTherapy extends StatefulWidget {
  const newTherapy({super.key});

  @override
  State<newTherapy> createState() => _newTherapyState();
}

class _newTherapyState extends State<newTherapy> {
  DateTime endDate = DateTime.now().add(const Duration(days: 1));
  DateTime startDate = DateTime.now();
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
      therapies.add(Therapy(name, dosage, pillsADay, pillsInBottle, startDate, endDate));
      // ignore: avoid_print
      
      nameController = TextEditingController();
      pillsADayController = TextEditingController();
      pillsInBottleController = TextEditingController();
      dosageController = TextEditingController();
       Navigator.push(context,
      MaterialPageRoute(builder: (context) => const Home()));
 
  }
  @override
  Widget build(BuildContext context) {
    
    final hours = time.hour.toString().padLeft(2, '0');
    final minutes = time.minute.toString().padLeft(2, '0');
    final eday = endDate.day.toString();
    final emonth = endDate.month.toString();
    final eyear = endDate.year.toString();
    final sday = startDate.day.toString();
    final smonth = startDate.month.toString();
    final syear = startDate.year.toString();
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
                        TextFormField(style: const TextStyle(color: Colors.white),focusNode: FocusNode(),decoration: InputDecoration(border: const OutlineInputBorder(),  labelText: 'Enter name of therapy...', labelStyle: TextStyle(fontStyle: FontStyle.italic,color: Colors.grey[500]),filled: true,fillColor: const Color.fromARGB(255, 26, 26, 26)),controller: nameController,),
                        const Padding(padding: EdgeInsets.all(15)),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget> [
                            Flexible(
                              child: TextFormField(style: const TextStyle(color: Colors.white),focusNode: FocusNode(),decoration: InputDecoration(border: const OutlineInputBorder(),  labelText: 'Daily pills...', labelStyle: TextStyle(fontStyle: FontStyle.italic,color: Colors.grey[500]),filled: true,fillColor: const Color.fromARGB(255, 26, 26, 26)),controller: pillsADayController,keyboardType: const TextInputType.numberWithOptions(decimal: false),),
                              ),
                            const Padding(padding: EdgeInsets.all(15)),
                            Flexible(
                              child: TextFormField(style: const TextStyle(color: Colors.white),  focusNode: FocusNode(),decoration: InputDecoration(border: const OutlineInputBorder(),  labelText: 'Dosage...', labelStyle: TextStyle(fontStyle: FontStyle.italic,color: Colors.grey[500]),filled: true,fillColor: const Color.fromARGB(255, 26, 26, 26),),controller: dosageController,keyboardType: const TextInputType.numberWithOptions(decimal: false),),
                            ),
                          ],
                        ),
                        const Padding(padding: EdgeInsets.all(15)),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget> [
                            Flexible(
                              child: TextFormField(style: const TextStyle(color: Colors.white),focusNode: FocusNode(),decoration: InputDecoration(border: const OutlineInputBorder(),  labelText: 'Current number of pills in bottle...', labelStyle: TextStyle(fontStyle: FontStyle.italic,color: Colors.grey[500]),filled: true,fillColor: const Color.fromARGB(255, 26, 26, 26)),controller: pillsInBottleController,keyboardType: const TextInputType.numberWithOptions(decimal: false),),
                              ),
                          ],
                        ),
                        const Padding(padding: EdgeInsets.all(10)),
                        /////////////////////////////////////////////////////////////////////////////////////////////////////////
                         Row(
                          children: <Widget>[
                            const Padding(padding: EdgeInsets.all(10)),
                            Expanded(flex: 1,child: Text('$smonth/$sday/$syear', style: const TextStyle(fontSize: 20, color: Colors.white),)),
                            const Padding(padding: EdgeInsets.all(10)),
                            Expanded(
                              flex: 1,
                              child: ElevatedButton(
                                onPressed: () async{
                                  DateTime? firstDay = await showDatePicker(
                                    context: context, 
                                    firstDate: DateTime(2000),
                                    lastDate: DateTime(2100),
                                    builder: (context, child) {
                                      return Theme(data: ThemeData.dark().copyWith(
                                        dialogBackgroundColor: const Color.fromARGB(255, 32, 32, 32),
                                        
                                      ),
                                      child: child!);
                                    },
                                    initialDate: startDate);
                                    if(firstDay == null) return;
                                    setState(() =>
                                      startDate = firstDay);                      
                                    }, 
                                child: Text('Choose start date')
                                ),
                            ),
                          ],
                        ),
                        const Padding(padding: EdgeInsets.all(8)),
                        Row(
                          children: <Widget>[
                            const Padding(padding: EdgeInsets.all(10)),
                            Expanded(flex: 1,child: Text('$emonth/$eday/$eyear', style: const TextStyle(fontSize: 20, color: Colors.white),)),
                            const Padding(padding: EdgeInsets.all(10)),
                            Expanded(
                              flex: 1,
                              child: ElevatedButton(
                                onPressed: () async{
                                  DateTime? lastDay = await showDatePicker(
                                    context: context, 
                                    firstDate: DateTime(2000),
                                    lastDate: DateTime(2100),
                                    builder: (context, child) {
                                      return Theme(data: ThemeData.dark().copyWith(
                                        dialogBackgroundColor: const Color.fromARGB(255, 32, 32, 32),
                                        
                                      ),
                                      child: child!);
                                    },
                                    initialDate: endDate);
                                    if(lastDay == null) return;
                                    setState(() =>
                                      endDate = lastDay);                      
                                    }, 
                                child: const Text('Choose end date'),
                                ),
                            ),
                          ],
                        ),
                        
                        /////////////////////////////////////////////////////////////////////////////////////////////////////////
                        const Padding(padding: EdgeInsets.all(10)),
                        Row(
                          children: <Widget>[
                            const Padding(padding: EdgeInsets.all(10)),
                            Expanded(flex: 1,child: Text('$hours:$minutes', style: const TextStyle(fontSize: 20, color: Colors.white),)),
                            const Padding(padding: EdgeInsets.all(10)),
                            Expanded(
                              flex: 4,
                              child: ElevatedButton(
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
