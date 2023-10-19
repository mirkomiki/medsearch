import 'package:flutter/material.dart';
import 'package:medsearch/Pages/editTherapyView.dart';
import 'package:medsearch/TypesOfData/infoTherapyCard.dart';
import 'package:medsearch/globals.dart';

class FullTherapy extends StatefulWidget {
  const FullTherapy({super.key});

  @override
  State<FullTherapy> createState() => _FullTherapyState();
}

class _FullTherapyState extends State<FullTherapy> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      appBar: AppBar(
        title: const Text('Your full therapy'),
        backgroundColor: const Color.fromARGB(255, 0, 164, 164),
      ),
      body: SingleChildScrollView(
        child: Column(
            children:
            therapies.map(
              (therapy) => infoTherapyCard( 
                therapy: therapy, 
                edit: () => 
                  Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => EditTherapy(therapy: therapy), // selectedTherapy is the therapy object to edit
                      ),
                    ).then((updatedTherapy) {
                      if (updatedTherapy != null) {
                        // Find the index of the therapy in the list
                        int index = therapies.indexOf(therapy);
                        if (index != -1) {
                          // Update the therapy object in the list with the updated one
                          setState(() {
                            therapies[index] = updatedTherapy;
                          });
                        }
                      }
                    }),
                delete: () {
                setState(() {
                  therapies.remove(therapy);
                });
              })).toList(),
        ),
      ),
    );
  }
}

