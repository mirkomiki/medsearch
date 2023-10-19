import 'package:flutter/material.dart';

class Therapy{
  //Attributes
  String name = '';
  int? dosage = 0;
  int? timesADay = 1;
  List<TimeOfDay> timeToTake = []; //koliko puta dnevno
  late DateTime overallTakingTime; //dokad se uzima
  int? pillsAvaliable = 0;
  DateTime lastDay = DateTime.now();
  DateTime firstDay = DateTime.now();
  
  //Constructor
  Therapy(String name, int? dosage, int? pillsInBottle, firstDay, lastDay, List<TimeOfDay>timeToTake){
    this.name = name;
    this.dosage = dosage;
    if(timeToTake.length >= 1){
      timesADay = timeToTake.length;
    }
    
    pillsAvaliable = pillsInBottle;
    this.lastDay = lastDay;
    this.firstDay = firstDay;
    this.timeToTake = timeToTake;
  }
} 