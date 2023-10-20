import 'package:flutter/material.dart';
import 'package:medsearch/TypesOfData/user.dart';
import 'package:medsearch/globals.dart';

class Family{
  late final int id;
  late String familyName;
  int numberOfMembers = 1;
  List<User> users = [];
  
  
  Family({required this.familyName, required this.numberOfMembers, required this.users}){
    id = familyCount + 1;
  }
  
}