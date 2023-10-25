
import 'package:medsearch/Pages/authPage.dart';
import 'package:medsearch/Pages/fullTherapyView.dart';
import 'package:medsearch/Pages/loading.dart';
import 'package:flutter/material.dart';
import 'package:medsearch/Pages/login.dart';
import 'package:medsearch/Pages/pages.dart';
import 'package:medsearch/SettingsPages/createFamily.dart';
import 'package:medsearch/SettingsPages/userAccount.dart';
import 'package:medsearch/firebase_options.dart';
import 'Pages/reminders.dart';
import 'SettingsPages/addFamilyMember.dart';
import 'SettingsPages/familyView.dart';
import 'SettingsPages/reportBugs.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';


void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
);
  runApp(MaterialApp(
    routes: {
      '/': (context) => const Loading(),
      '/auth': (context) => const AuthPage(),
      '/pages': (context) => const Pages(),
      '/full-therapy': (context) => const FullTherapy(),
      '/reminders': (context) => const Reminders(),
      '/user': (context) => const UserEdit(),
      '/report-bug':(context) => const BugReportForm(),
      '/add-family-member':(context) => const AddFamilyMember(),
      '/edit-family-settings':(context) => const EditFamily(),
      '/create-family':(context) => const CreateFamily(),
    }, 
  )
  );
}
