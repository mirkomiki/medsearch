import 'package:flutter/material.dart';
import 'package:medsearch/TypesOfData/therapy.dart';

// FILE WITH GLOBAL VARIABLES AND FUNCTIONS

List<Therapy> therapies = [
    Therapy('Sinersul', 500, 1, 20, DateTime.now(), DateTime.now()),
    Therapy('Brufen', 1000, 2, 40, DateTime.now(), DateTime.now()),
    Therapy('Redbull', 330, 1, 1, DateTime.now(), DateTime.now()),
  ];
  Therapy getFromTherapies(int index){
    return therapies.elementAt(index);
  }

  void setTherapiesReminder(int index2, List<TimeOfDay> list){
    therapies[index2].timeToTake = list;
  }
  int selectedPageIndex = 0;
  int globalDailyReminders = 1;