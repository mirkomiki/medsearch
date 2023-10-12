import 'package:flutter/material.dart';
import 'package:medsearch/TypesOfData/therapy.dart';
import 'package:medsearch/globals.dart';

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
  int index = 1;
  TextEditingController nameController = TextEditingController();
  TextEditingController dosageController = TextEditingController();
  TextEditingController pillsAvaliableController = TextEditingController();
  TextEditingController timesADayController = TextEditingController();
  @override
  void initState() {
    super.initState();
    nameController.text = widget.therapy.name;
    dosageController.text = widget.therapy.dosage.toString();
    pillsAvaliableController.text = widget.therapy.pillsAvaliable.toString();
    timesADayController.text = widget.therapy.timesADay.toString();
    endDate = widget.therapy.lastDay;
    startDate = widget.therapy.firstDay;
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
          title: Text('Edit Therapy'),
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
                    children: [
                      Flexible(child: TextFormField(controller: timesADayController, style: const TextStyle(color: Colors.white),keyboardType: const TextInputType.numberWithOptions(decimal: false),decoration: InputDecoration(border: const OutlineInputBorder(), labelText: 'Times a day',labelStyle: TextStyle(fontStyle: FontStyle.italic,color: Colors.grey[500]),filled: true,fillColor: const Color.fromARGB(255, 26, 26, 26)))),
                      const Padding(padding: EdgeInsets.all(15)),
                      Flexible(child: TextFormField(controller: dosageController, style: const TextStyle(color: Colors.white),keyboardType: const TextInputType.numberWithOptions(decimal: false),decoration: InputDecoration(border: const OutlineInputBorder(), labelText: 'Dosage (mg)',labelStyle: TextStyle(fontStyle: FontStyle.italic,color: Colors.grey[500]),filled: true,fillColor: const Color.fromARGB(255, 26, 26, 26)))),
                      
                      
                    ],
                  ),
                  const Padding(padding: EdgeInsets.all(15)),
                  TextFormField(controller: pillsAvaliableController, style: const TextStyle(color: Colors.white),keyboardType: const TextInputType.numberWithOptions(decimal: false),decoration: InputDecoration(border: const OutlineInputBorder(), labelText: 'Pills left',labelStyle: TextStyle(fontStyle: FontStyle.italic,color: Colors.grey[500]),filled: true,fillColor: const Color.fromARGB(255, 26, 26, 26))),
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
                    onPressed: () {
                      widget.therapy.name = nameController.text;
                      widget.therapy.dosage = int.parse(dosageController.text);
                      widget.therapy.pillsAvaliable = int.parse(pillsAvaliableController.text);
                      widget.therapy.timesADay = int.parse(timesADayController.text);
                      widget.therapy.firstDay = startDate;
                      widget.therapy.lastDay = endDate;
                      // Navigate back to the previous page with the updated therapy object
                      Navigator.of(context).pop(widget.therapy);
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
}





//CREDIT TO CHATGPT == GRESKA JE BIO MOJ UPIS NA RACUNARSTVO