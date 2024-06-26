import 'package:decorated_dropdownbutton/decorated_dropdownbutton.dart';
import 'package:flutter/material.dart';
import 'package:medsearch/Pages/TimePickerWidget.dart';
import 'package:medsearch/Pages/pages.dart';
import 'package:medsearch/TypesOfData/therapy.dart';
import 'package:medsearch/TypesOfData/userTile.dart';
import 'package:medsearch/globals.dart';

const List<String> dailyPillsItemList = <String>['1', '2', '3', '4', '5', '6'];
class NewTherapy extends StatefulWidget {
  const NewTherapy({super.key});

  @override
  State<NewTherapy> createState() => _NewTherapyState();
}

class _NewTherapyState extends State<NewTherapy> {
  DateTime endDate = DateTime.now().add(const Duration(days: 1));
  DateTime startDate = DateTime.now();
  List<TimeOfDay> reminderList = [TimeOfDay.now()];
  int index = 1;
  TextEditingController nameController = TextEditingController();
  late int? pillsADay = 1;
  TextEditingController pillsInBottleController = TextEditingController();
  TextEditingController dosageController = TextEditingController();


  late String name = nameController.text;
  late int? dosage = int.tryParse(dosageController.text);
  late int? pillsInBottle= int.tryParse(pillsInBottleController.text);

  void finishAddTherapy(){
      localFamily.users[selectedPerson].therapies.add(Therapy(name, dosage, pillsInBottle, startDate, endDate, reminderList));
      // ignore: avoid_print
      nameController = TextEditingController();
      pillsInBottleController = TextEditingController();
      dosageController = TextEditingController();
      selectedPageIndex = 0;
      reminderList = [TimeOfDay.now()];
      selectedPageIndex = 0;
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const Pages()),
      );
  }
  int selectedPerson = 0;
  @override
  Widget build(BuildContext context) {
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
                              child: TextFormField(style: const TextStyle(color: Colors.white),focusNode: FocusNode(),decoration: InputDecoration(border: const OutlineInputBorder(),  labelText: 'Current number of pills in bottle...', labelStyle: TextStyle(fontStyle: FontStyle.italic,color: Colors.grey[500]),filled: true,fillColor: const Color.fromARGB(255, 26, 26, 26)),controller: pillsInBottleController,keyboardType: const TextInputType.numberWithOptions(decimal: false),),
                              
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
                                flex: 1,
                                  child: DropdownButtonHideUnderline(
                                    child: DropdownButtonFormField<int>(
                                      value: pillsADay,
                                      
                                      decoration: const InputDecoration(
                                        filled: true,
                                        label: Text('Pills a day', style: TextStyle(color: Colors.black),),
                                        fillColor: Colors.grey,
                                        focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.black, width: 3),),
                                        enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.black, width: 3),)), 
                                        dropdownColor: const Color.fromARGB(255, 202, 202, 202),
                                      onChanged: (int? value) {
                                        // This is called when the user selects an item.
                                        setState(() {
                                          pillsADay = value!;
                                          _updateReminderList();
                                        });
                                      },
                                      items: List.generate(6, (index) {
                                        return DropdownMenuItem<int>(
                                          value: index + 1,
                                          child: Text((index + 1).toString(), style: const TextStyle(color: Colors.black, fontSize: 14),),
                                        );
                                      },
                                      ),
                                                                  ),
                                  ),
                              ),
                             Flexible(
                              flex: 1,
                            // ignore: avoid_print
                            child: DropdownButtonHideUnderline(
                              child: DropdownButton<int>(
                                value: selectedPerson, 
                                onChanged: (int? value) {
                                  // This is called when the user selects an item.
                                  setState(() {
                                    selectedPerson = value!;
                                    //print('Jel ulazis');
                                  });
                                },
                                style: const TextStyle(color: Colors.deepPurple),
                                  underline: Container(
                                  height: 2,
                                  color: Colors.deepPurpleAccent,),
                                items: List.generate(localFamily.users.length, (index) {
                                  return DropdownMenuItem<int>(
                                    value: index,
                                    child: UserTile(user: localFamily.users[index]),
                                  );
                                },
                                ),
                                                            ),
                                  ),
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
                                child: const Text('Choose start date')
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
                        
                      SizedBox(
                        height: 300,
                        child: ListView.builder(
                          itemCount: pillsADay,
                          itemBuilder: (context, index) {
                            return TimePickerWidget(
                              indexTherapy: index,
                              timeOfDay: reminderList[index],
                              onChanged: (newTime) {
                                setState(() {
                                  reminderList[index] = newTime;
                                });
                              },
                            );
                          },
                        ),
                      ),
                      ElevatedButton(
                            onPressed: () {finishAddTherapy();}, 
                            child: const Text('NEXT')
                      ),
                      ],
                    ),
                    
                  ),
                ),
              ) ,
        ),
        
      ); 
      
  }
  void _updateReminderList() {
    while (reminderList.length <= pillsADay!) {
      reminderList.add(TimeOfDay.now());
    }
    
  }
}

