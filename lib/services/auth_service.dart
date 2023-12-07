
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:mailer/mailer.dart';


class AuthService{

  static final GoogleSignIn _googleSignIn = GoogleSignIn(); // <----
  final FacebookAuth _facebookAuth = FacebookAuth.instance;
  Map<String, dynamic>? userData;
  signInWithGoogle() async{
    
    final GoogleSignInAccount? gUser = await GoogleSignIn().signIn();

    final GoogleSignInAuthentication gAuth = await gUser!.authentication;

    final credential = GoogleAuthProvider.credential(accessToken: gAuth.accessToken, idToken: gAuth.idToken);
    
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }
  signInWithFacebook() async{
    

    final LoginResult result = await FacebookAuth.instance.login(
      loginBehavior: LoginBehavior.dialogOnly,
    ); 
    if(result.status == LoginStatus.success || result.status == LoginStatus.operationInProgress){
      final _userData =  FacebookAuth.instance.getUserData();
      final OAuthCredential fCredential = FacebookAuthProvider.credential(result.accessToken!.token);
    //final userData = await FacebookAuth.instance.getUserData();

      return await FirebaseAuth.instance.signInWithCredential(fCredential);
      
    } else {
      print("EXCEPTION AL TI NECU REC STA HEHE");
    }
    
    
  }
  Future signOut() async {
  await _googleSignIn.signOut();
  await _facebookAuth.logOut();
  var result = await FirebaseAuth.instance.signOut();
  return result;
  }

}