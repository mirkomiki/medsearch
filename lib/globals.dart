import 'package:flutter/material.dart';
import 'package:medsearch/TypesOfData/therapy.dart';
import 'package:medsearch/TypesOfData/user.dart';

// FILE WITH GLOBAL VARIABLES AND FUNCTIONS

List<Therapy> therapies = [
    Therapy('Sinersul', 500, 20, DateTime.now(), DateTime.now().add(const Duration(days: 1)), [const TimeOfDay(hour: 9, minute: 0),
    const TimeOfDay(hour: 12, minute: 30),
    const TimeOfDay(hour: 18, minute: 15),]),
    Therapy('Brufen', 1000,  40, DateTime.now(),  DateTime.now().add(const Duration(days: 1)), [const TimeOfDay(hour: 8, minute: 0),
    const TimeOfDay(hour: 12, minute: 30),]),
    Therapy('Redbull', 330, 1, DateTime.now(),  DateTime.now().add(const Duration(days: 1)), [const TimeOfDay(hour: 8, minute: 0),
    const TimeOfDay(hour: 12, minute: 30),
    const TimeOfDay(hour: 18, minute: 15),]),
    
  ];
  Therapy getFromTherapies(int index){
    return therapies.elementAt(index);
  }

  void setTherapiesReminder(int index2, List<TimeOfDay> list){
    therapies[index2].timeToTake = list;
  }
  int selectedPageIndex = 0;
  int globalDailyReminders = 1;
  List<DateTime> dailyReminders = [];
  void generateDailyReminders () {

  }
  int userCount = 0;
  int familyCount = 0;
  User localUser = User(username: 'Hrcak', name: 'Biti', surname: 'Ne biti', age: 4);
  