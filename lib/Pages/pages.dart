import 'package:flutter/material.dart';
import 'package:medsearch/Pages/home.dart';
import 'package:medsearch/Pages/newTherapy.dart';
import 'package:medsearch/Pages/settings.dart';
import 'package:medsearch/dailyTherapyCard.dart';
import 'package:medsearch/therapy.dart';

class Pages extends StatefulWidget {
  const Pages({super.key});
  
  @override
  State<Pages> createState() => _PagesState();
}

  

class _PagesState extends State<Pages> {
  int selectedIndex = 0;
  
  void onTapped(int index){
      setState(() {
        selectedIndex = index;
      });
    }
  

  final List<Widget> _pages = [
    const Home(),
    const newTherapy(),
    const Settings(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages.elementAt(selectedIndex),
      backgroundColor: Colors.grey[900],
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(
          color:  Color.fromARGB(30, 255, 255, 255),
          border: Border(top: BorderSide(color: Color.fromARGB(0, 255, 255, 255), width: 0.75))  
                      ),
        child: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.add_box_rounded),
                label: 'New Reminder',
              ),
              BottomNavigationBarItem(
                
                icon: Icon(Icons.manage_accounts),
                label: 'Settings',
              ),
              
          ],  
          currentIndex: selectedIndex,
          type: BottomNavigationBarType.fixed,
          backgroundColor: Color.fromARGB(255, 26, 26, 26),
          unselectedItemColor: const Color.fromARGB(129, 255, 255, 255),
          selectedItemColor: Colors.white,
          onTap: onTapped,
        ),
      ),
    );
  }
}