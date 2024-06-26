import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:medsearch/TypesOfData/customButton.dart';
import 'package:medsearch/TypesOfData/customTextField.dart';
import 'package:medsearch/TypesOfData/squareTile.dart';
import 'package:medsearch/services/auth_service.dart';

class LoginPage extends StatefulWidget {
  LoginPage({super.key, required this.onTap});
  final Function()? onTap;
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  void signUserIn()  async {
    showDialog(context: context, builder: (context){
      return const Center(
        child: CircularProgressIndicator(),
      );
    });
    try {
    await FirebaseAuth.instance.signInWithEmailAndPassword(email: emailController.text, password: passwordController.text);
    Navigator.pop(context);
    }on FirebaseAuthException catch(e){
      Navigator.pop(context);
      wrongEmailPasswordMessage();
        
        
      }
    // ignore: use_build_context_synchronously
  }
  void wrongEmailPasswordMessage() {
      showDialog(context: context, useSafeArea: false, builder: (context){
        
        return const AlertDialog(title: Text('Wrong Credentials'));
        
      });
    }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SingleChildScrollView(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
            // logo
            const SizedBox(height: 50,),
            const Icon(Icons.lock,
            size: 100,
            ),
            const SizedBox(height: 25,),
            //welcome
            Text('Welcome, you have been missed',style: TextStyle(color: Colors.grey[700], fontSize: 16),),
            const SizedBox(height: 25,),
            // username
            CustomTextField(controller: emailController, hintText: 'Email', obsureText: false),
            //password
            const SizedBox(height: 10,),
            CustomTextField(controller: passwordController, hintText: 'Password', obsureText: true),
            //forgot password
            Padding(
              padding: const EdgeInsets.fromLTRB(25.0,8,25.0,25.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text('Forgot password?', style: TextStyle(color: Colors.grey[600]),),
                ],
              ),
            ),
            const SizedBox(height: 25,),
            //sign in button
            CustomButton(onTap: signUserIn),
            //or continue with
            Row(
              children: [
                Expanded(
                  child: Divider(
                    thickness: 0.5,
                    color: Colors.grey[400],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8),
                  child: Text('Or Continue With',
                  style: TextStyle(color: Colors.grey[700]),),
                ),
                Expanded(
                  child: Divider(
                    thickness: 0.5,
                    color: Colors.grey[400],
                  ),
                ),
              ],
            ),
            //google+apple+facebook sign in button
            const SizedBox(height: 25,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SquareTile(imagePath: 'assets/google-logo.png', onTap: () => AuthService().signInWithGoogle(),),
                const SizedBox(width: 25,),
                SquareTile(imagePath: 'assets/facebook-logo.png', onTap: () => AuthService().signInWithFacebook(),),
              ],
            ),
            const SizedBox(height: 25,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Not a member?', style: TextStyle(color: Colors.grey[700]),),
                InkWell(
                  onTap: widget.onTap,
                  child: const Padding(
                    padding: EdgeInsets.all(4.0),
                    child: Text('Register',
                    style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),),
                  ),
                ),
              ],
            ),
            //not a member register now
          ]),
      ),
      
    );
  }
  
  
}
