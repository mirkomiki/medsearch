import 'package:flutter/material.dart';

class AddFamilyMember extends StatefulWidget {
  const AddFamilyMember({super.key});

  @override
  State<AddFamilyMember> createState() => _AddFamilyMemberState();
}

class _AddFamilyMemberState extends State<AddFamilyMember> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      appBar: AppBar(
        title: const Text('Invite family members'), //QR INVITE DO APLIKACIJE, "KOD" OBITELJI 
        backgroundColor: const Color.fromARGB(255, 0, 164, 164),
      ),
    );
  }
}