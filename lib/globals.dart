import 'package:flutter/material.dart';
import 'package:medsearch/TypesOfData/family.dart';
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
  //Family localFamily = Family(familyName: '', users: []);
  int userCount = 0;
  int familyCount = 0;
  User localUser = User(username: 'Hrcak', password: '',name: 'Biti', surname: 'Ne biti', age: 4, therapies: [Therapy('Sinersul', 500, 20, DateTime.now(), DateTime.now().add(const Duration(days: 1)), [const TimeOfDay(hour: 9, minute: 0)])]);
  User localUser2 = User(username: 'Hrcak2',password: '', name: 'Liti', surname: 'De1 biti', age: 5, therapies: [Therapy('Nes drugo', 500, 20, DateTime.now(), DateTime.now().add(const Duration(days: 1)), [const TimeOfDay(hour: 9, minute: 0)])]);
  User localUser3 = User(username: 'Hrcak3',password: '', name: 'Piti', surname: 'De2 biti', age: 6, therapies: [Therapy('Nes trece', 500, 20, DateTime.now(), DateTime.now().add(const Duration(days: 1)), [const TimeOfDay(hour: 9, minute: 0)])]);
  Family localFamily = Family(familyName: 'Svinjcekovi', users: [localUser, localUser2, localUser3]);