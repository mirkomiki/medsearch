import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:medsearch/TypesOfData/therapy.dart';
import 'package:medsearch/globals.dart';

class User{
  late final int id;
  String name;
  String surname;
  int? age;
  String username;
  late CircleAvatar avatar;
  List<Therapy> therapies;

  User({required this.username, required this.name, required this.surname, required this.age, required this.therapies}){
    id = userCount + 1;
    String firstLetterName = name.characters.elementAt(0);
    String firstLetterSurname = surname.characters.elementAt(0);
    avatar = CircleAvatar(radius: 80,child: Text('$firstLetterName$firstLetterSurname'),);
    
  }
  set setTherapies(List<Therapy> t) {
    therapies = t;
  }
}