import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:medsearch/Pages/loading.dart';
import 'package:medsearch/Pages/login.dart';
import 'package:medsearch/Pages/login_or_register.dart';
import 'package:medsearch/Pages/pages.dart';
import 'package:medsearch/globals.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          //is user logged in
          if(snapshot.hasData){
            return const Pages();
          } else{
            return LoginRegisterPage();
          }
          
          //is not logged in
        },
        
      ),
    );
  }
}