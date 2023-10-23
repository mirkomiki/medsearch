import 'package:flutter/material.dart';
import 'package:medsearch/Pages/TimePickerWidget.dart';
import 'package:medsearch/Pages/newTherapy.dart';
import 'package:medsearch/TypesOfData/therapy.dart';

class EditTherapy extends StatefulWidget {
  final Therapy therapy;
  const EditTherapy({super.key, required this.therapy});
  @override
  State<EditTherapy> createState() => _EditTherapyState(
  );
}

class _EditTherapyState extends State<EditTherapy> {
  
 
  TimeOfDay time = TimeOfDay.now();
  DateTime endDate = DateTime.now().add(const Duration(days: 1));
  DateTime startDate = DateTime.now();
  List<TimeOfDay> reminders = [];
  int index = 1;
  int? pillsADay = 1;
  TextEditingController nameController = TextEditingController();
  TextEditingController dosageController = TextEditingController();
  TextEditingController pillsAvaliableController = TextEditingController();
  
  @override
  void initState() {
    super.initState();
    nameController.text = widget.therapy.name;
    dosageController.text = widget.therapy.dosage.toString();
    pillsAvaliableController.text = widget.therapy.pillsAvaliable.toString();
    pillsADay = widget.therapy.timeToTake.length;
    reminders = widget.therapy.timeToTake;
    endDate = widget.therapy.lastDay;
    startDate = widget.therapy.firstDay;
  }

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
          title: const Text('Edit Therapy'),
          backgroundColor: const Color.fromARGB(255, 0, 164, 164),
        ),
        body: Form(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: SingleChildScrollView(
              child: Column(
                
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  TextFormField(controller: nameController,style: const TextStyle(color: Colors.white), decoration: InputDecoration(border: const OutlineInputBorder(), labelText: 'Name',labelStyle: TextStyle(fontStyle: FontStyle.italic,color: Colors.grey[500]),filled: true,fillColor: const Color.fromARGB(255, 26, 26, 26))),
                  const Padding(padding: EdgeInsets.all(15)),
                  Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget> [
                            Flexible(
                              child: TextFormField(style: const TextStyle(color: Colors.white),focusNode: FocusNode(),decoration: InputDecoration(border: const OutlineInputBorder(),  labelText: 'Current number of pills in bottle...', labelStyle: TextStyle(fontStyle: FontStyle.italic,color: Colors.grey[500]),filled: true,fillColor: const Color.fromARGB(255, 26, 26, 26)),controller: pillsAvaliableController,keyboardType: const TextInputType.numberWithOptions(decimal: false),),
                              
                              ),
                            const Padding(padding: EdgeInsets.all(15)),
                            Flexible(
                              child: TextFormField(style: const TextStyle(color: Colors.white),  focusNode: FocusNode(),decoration: InputDecoration(border: const OutlineInputBorder(),  labelText: 'Dosage...', labelStyle: TextStyle(fontStyle: FontStyle.italic,color: Colors.grey[500]),filled: true,fillColor: const Color.fromARGB(255, 26, 26, 26),),controller: dosageController,keyboardType: const TextInputType.numberWithOptions(decimal: false),),
                            ),
                          ],
                        ),
                  const Padding(padding: EdgeInsets.all(15)),
                  
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
                                    initialDate: widget.therapy.firstDay);
                                    if(firstDay == null) return;
                                    setState(() =>
                                      startDate = firstDay);                      
                                    }, 
                                child: const Text('Choose start date')
                                ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget> [
                              Flexible(
                                  // ignore: avoid_print
                                  child: DropdownButton<int>(value: pillsADay, onChanged: (int? value) {
                                      // This is called when the user selects an item.
                                      setState(() {
                                        pillsADay = value!;
                                        //print('Jel ulazis');
                                        _updateReminderList();
                                      });
                                    },
                                    items: List.generate(6, (index) {
                                      return DropdownMenuItem<int>(
                                        value: index + 1,
                                        child: Text((index + 1).toString()),
                                      );
                                    },
                                    ),
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
                                    initialDate: widget.therapy.lastDay);
                                    if(lastDay == null) return;
                                    setState(() =>
                                      endDate = lastDay);                      
                                    }, 
                                child: const Text('Choose end date'),
                                ),
                            ),
                          ],
                        ),
                        SizedBox(
                        height: 300,
                        child: ListView.builder(
                          itemCount: pillsADay,
                          itemBuilder: (context, index) {
                            return TimePickerWidget(
                              indexTherapy: index,
                              timeOfDay: reminders[index],
                              onChanged: (newTime) {
                                setState(() {
                                  reminders[index] = newTime;
                                });
                              },
                            );
                          },
                        ),
                      ), 
                        /////////////////////////////////////////////////////////////////////////////////////////////////////////
                  const Padding(padding: EdgeInsets.all(10)),
                  /*Row(
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
                  ),*/
                  ElevatedButton(
                    onPressed: () {
                      widget.therapy.name = nameController.text;
                      widget.therapy.dosage = int.parse(dosageController.text);
                      widget.therapy.pillsAvaliable = int.parse(pillsAvaliableController.text);
                      widget.therapy.timeToTake = reminders;
                      widget.therapy.firstDay = startDate;
                      widget.therapy.lastDay = endDate;
                      widget.therapy.timesADay = pillsADay;
                      
                      // Navigate back to the previous page with the updated therapy object
                      Navigator.pop(context);
                      setState(() {});
                    },
                    child: const Text('Save Changes'),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
  void _updateReminderList() {
    // do ovdje je pillsADay dobar
    while (reminders.length < pillsADay!) {
      reminders.add(TimeOfDay.now());
      //print(reminders.length); //a kao dobar je, li la vidit cemo
    }
    if(pillsADay! < reminders.length){
      reminders.removeRange(pillsADay!, reminders.length);
    }
    
  }
}

//CREDIT TO CHATGPT == GRESKA JE BIO MOJ UPIS NA RACUNARSTVO