import 'package:flutter/material.dart';
import 'package:medsearch/Pages/editTherapyView.dart';
import 'package:medsearch/Pages/pages.dart';
import 'package:medsearch/TypesOfData/Themes/homeAvatars.dart';
import 'package:medsearch/TypesOfData/infoTherapyCard.dart';
import 'package:medsearch/globals.dart';

class FullTherapy extends StatefulWidget {
  const FullTherapy({super.key});
  
  @override
  State<FullTherapy> createState() => _FullTherapyState();
}

class _FullTherapyState extends State<FullTherapy> {
  int selectedPerson = 0;
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
            children: [
              Row(
                children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(15, 15, 15, 15),
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                          child: SizedBox(
                            width: MediaQuery.of(context).size.width * 0.9,
                            height: MediaQuery.of(context).size.height * 0.14,
                            child: ListView.separated(
                              scrollDirection: Axis.horizontal,
                              separatorBuilder: (context, index) {
                                return const SizedBox(width: 10,);
                              },
                              shrinkWrap: true,
                              itemCount: localFamily.users.length,
                              itemBuilder: (BuildContext context, int index) {  
                                return InkWell(
                                onTap: () {
                                  setState(() {
                                    
                                    selectedPerson = index;
                                  });
                                },
                                radius: 35,
                                child: HomeAvatarCard(user: localFamily.users[index]));
                              },
                            ),
                          ),
                      ),
                    ),
                ],
              ),
          ListView.builder(
            itemCount: localFamily.users[selectedPerson].therapies.length,
            shrinkWrap: true,
            itemBuilder: (context, index) => 
              infoTherapyCard( 
                therapy: localFamily.users[selectedPerson].therapies[index], 
                edit: () => 
                  Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => EditTherapy(therapy: localFamily.users[selectedPerson].therapies[index], user: localFamily.users[selectedPerson],), // selectedTherapy is the therapy object to edit
                      ),
                    ).then((updatedTherapy) {
                      if (updatedTherapy != null) {
                        
                        int xindex = therapies.indexOf(localFamily.users[selectedPerson].therapies[index]);
                        if (xindex != -1) {
                          // Update the therapy object in the list with the updated one
                          setState(() {
                             localFamily.users[selectedPerson].therapies[xindex] = updatedTherapy;
                          });
                        }
                      }
                    }).then((value) => setState(() => {})),
                delete: () {
                setState(() {
                  localFamily.users[selectedPerson].therapies.remove(localFamily.users[selectedPerson].therapies[index]);
                });
              },
              ),
              ),
          ],
        ),
        
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add, size: 30,),
        onPressed: ()
        {selectedPageIndex = 1;
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const Pages()),);
          },
      
      ),
    );
  }
}

