import 'package:flutter/material.dart';
import 'package:medsearch/TypesOfData/user.dart';
import 'package:medsearch/globals.dart';

class Family{
  late final int id;
  late String familyName;
  late List<User> users = [];
  
  
  Family({required this.familyName, required this.users}){
    id = familyCount + 1;
  }
}