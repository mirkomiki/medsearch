import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';


class AuthService{

  static final GoogleSignIn _googleSignIn = GoogleSignIn(); // <----

  signInWithGoogle() async{
    
    final GoogleSignInAccount? gUser = await GoogleSignIn().signIn();

    final GoogleSignInAuthentication gAuth = await gUser!.authentication;

    final credential = GoogleAuthProvider.credential(accessToken: gAuth.accessToken, idToken: gAuth.idToken);
    
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }

  signInWithFacebook() async{
    final LoginResult result = await FacebookAuth.instance.login(
      //permissions: ['email', 'public_profile', 'name', 'surname']
    ); // by default we request the email and the public profile

    // loginBehavior is only supported for Android devices, for ios it will be ignored
    // final result = await FacebookAuth.instance.login(
    //   permissions: ['email', 'public_profile', 'user_birthday', 'user_friends', 'user_gender', 'user_link'],
    //   loginBehavior: LoginBehavior
    //       .DIALOG_ONLY, // (only android) show an authentication dialog instead of redirecting to facebook app
    // );
    final OAuthCredential fCredential = FacebookAuthProvider.credential(result.accessToken!.token);
    //final userData = await FacebookAuth.instance.getUserData();
    if (result.status == LoginStatus.success) {
      return await FirebaseAuth.instance.signInWithCredential(fCredential);
    }
  }
  Future signOut() async {
  await _googleSignIn.signOut();
  var result = await FirebaseAuth.instance.signOut();
   
  return result;
}
}