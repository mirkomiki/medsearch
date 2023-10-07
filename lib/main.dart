import 'package:medsearch/Pages/loading.dart';
import 'package:flutter/material.dart';
import 'package:medsearch/Pages/home.dart';
import 'package:medsearch/dailyTherapyCard.dart';
import 'therapy.dart';
void main() => runApp(MaterialApp(
  initialRoute:'/home',
  routes: {
    '/': (context) => Loading(),
    '/home': (context) => Home() 
  },
)
);