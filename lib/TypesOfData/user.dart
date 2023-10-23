import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:medsearch/TypesOfData/therapy.dart';
import 'package:medsearch/globals.dart';

class User{
  late final int id;
  String name = '';
  String surname = '';
  int? age = 0;
  String username = '';
  late CircleAvatar avatar;
  late List<Therapy> therapies;

  User({required String username, required String name, required String surname, required int age, required List<Therapy> therapies}){
    this.name = name ;
    this.username = username;
    this.surname = surname;
    id = userCount + 1;
    this.age = age;
    String firstLetterName = name.characters.elementAt(0);
    String firstLetterSurname = surname.characters.elementAt(0);
    avatar = CircleAvatar(radius: 80,child: Text('$firstLetterName$firstLetterSurname'),);
    this.therapies = therapies;
  }

}

