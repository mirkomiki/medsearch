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
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Therapy'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(controller: nameController, decoration: InputDecoration(labelText: 'Name')),
            TextField(controller: dosageController, decoration: InputDecoration(labelText: 'Dosage (mg)')),
            TextField(controller: pillsAvaliableController, decoration: InputDecoration(labelText: 'Frequency')),
            TextField(controller: timesADayController, decoration: InputDecoration(labelText: 'Duration (days)')),
            ElevatedButton(
              onPressed: () {
                // Update the therapy object with the edited values
                widget.therapy.name = nameController.text;
                widget.therapy.dosage = int.parse(dosageController.text);
                widget.therapy.pillsAvaliable = int.parse(pillsAvaliableController.text);
                widget.therapy.timesADay = int.parse(timesADayController.text);

                // Navigate back to the previous page with the updated therapy object
                Navigator.of(context).pop(widget.therapy);
              },
              child: Text('Save Changes'),
            ),
          ],
        ),
      ),
    );
  }
}




//CREDIT TO CHATGPT == GRESKA JE BIO MOJ UPIS NA RACUNARSTVO