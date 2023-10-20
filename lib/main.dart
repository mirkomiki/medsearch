

import 'package:medsearch/Pages/fullTherapyView.dart';
import 'package:medsearch/Pages/loading.dart';
import 'package:flutter/material.dart';
import 'package:medsearch/Pages/pages.dart';
import 'package:medsearch/SettingsPages/userAccount.dart';
import 'Pages/reminders.dart';
import 'SettingsPages/addFamilyMember.dart';
import 'SettingsPages/familyView.dart';
import 'SettingsPages/reportBugs.dart';

void main() => runApp(MaterialApp(
    routes: {
      '/': (context) => const Loading(),
      '/pages': (context) => const Pages(),
      '/full-therapy': (context) => const FullTherapy(),
      '/reminders': (context) => const Reminders(),
      '/user': (context) => const UserEdit(),
      '/report-bug':(context) => const BugReportForm(),
      '/add-family-member':(context) => const AddFamilyMember(),
      '/edit-family-settings':(context) => const EditFamily(),
    }, 
  )
);