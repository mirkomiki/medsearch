

import 'package:medsearch/Pages/editTherapyView.dart';
import 'package:medsearch/Pages/fullTherapyView.dart';
import 'package:medsearch/Pages/home.dart';
import 'package:medsearch/Pages/loading.dart';
import 'package:flutter/material.dart';
import 'package:medsearch/Pages/newTherapy.dart';
import 'package:medsearch/Pages/pages.dart';
import 'package:medsearch/SettingsPages/userAccount.dart';
import 'package:medsearch/globals.dart';
import 'Pages/reminders.dart';
import 'SettingsPages/addFamilyMember.dart';
import 'SettingsPages/familyView.dart';
import 'SettingsPages/reportBugs.dart';

void main() => runApp(MaterialApp(
  initialRoute:'/loading',
  routes: {
    '/': (context) => const Loading(),
    '/pages': (context) => const Pages(),
    '/full-therapy': (context) => const FullTherapy(),
    '/reminders': (context) => const Reminders(),
    '/user': (context) => const UserEdit(),
    '/report-bug':(context) => const ReportBug(),
    '/add-family-member':(context) => const AddFamilyMember(),
    '/edit-family-settings':(context) => const EditFamily(),
  }, 
)
);