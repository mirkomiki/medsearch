
import 'package:medsearch/Pages/fullTherapyView.dart';
import 'package:medsearch/Pages/loading.dart';
import 'package:flutter/material.dart';
import 'package:medsearch/Pages/newTherapy.dart';
import 'package:medsearch/Pages/pages.dart';
import 'package:medsearch/Pages/settings.dart';
import 'package:medsearch/settingsPages/userAccount.dart';
import 'Pages/reminders.dart';
import 'settingsPages/addFamilyMember.dart';
import 'settingsPages/familyView.dart';
import 'settingsPages/reportBugs.dart';

void main() => runApp(MaterialApp(
  initialRoute:'/loading',
  routes: {
    '/': (context) => const Loading(),
    '/pages': (context) => const Pages(),
    '/full-therapy': (context) => const FullTherapy(),
    '/reminders': (context) => const Reminders(),
    '/add-therapy':(context) => const newTherapy(),
    '/settings': (context) => const Settings(),
    '/user': (context) => const UserEdit(),
    '/report-bug':(context) => const ReportBug(),
    '/add-family-members':(context) => const AddFamilyMember(),
    '/edit-family-settings':(context) => const EditFamily(),

  },
)
);