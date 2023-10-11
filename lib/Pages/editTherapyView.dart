import 'package:flutter/material.dart';
import 'package:medsearch/TypesOfData/therapy.dart';
import 'package:medsearch/globals.dart';
class EditTherapy extends StatefulWidget {
  final Therapy therapy;
  const EditTherapy({super.key, required this.therapy});
  @override
  State<EditTherapy> createState() => _EditTherapyState();
}

class _EditTherapyState extends State<EditTherapy> {
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
                  
                  ElevatedButton(
                    onPressed: () {
                      widget.therapy.name = nameController.text;
                      widget.therapy.dosage = int.parse(dosageController.text);
                      widget.therapy.pillsAvaliable = int.parse(pillsAvaliableController.text);
                      widget.therapy.timesADay = int.parse(timesADayController.text);
              
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