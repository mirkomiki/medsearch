import 'package:flutter/material.dart';
import 'package:medsearch/SettingsPages/addNewMemberUser.dart';

class AddFamilyMember extends StatefulWidget {
  const AddFamilyMember({super.key});

  @override
  State<AddFamilyMember> createState() => _AddFamilyMemberState();
}
void addViaQRCode(){
}
void shareLink(){}
class _AddFamilyMemberState extends State<AddFamilyMember> {
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      appBar: AppBar(
        title: const Text('Invite family members'), //QR INVITE DO APLIKACIJE, "KOD" OBITELJI 
        backgroundColor: const Color.fromARGB(255, 0, 164, 164),
      ),
      body:
      Column(children: [
        const SizedBox(height: 40,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton.icon(onPressed: () {addViaQRCode;} , label: const Text('Add via QR code'), icon: const Icon(Icons.qr_code),),
            ],
          ),
          const SizedBox(height: 40,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton.icon(onPressed: () async{
                await Navigator.push(context,
              MaterialPageRoute(builder: (context) => NewFamilyMemberManualy()),);
              setState(() {}); 
              },
                label: const Text('Add manualy'), 
                icon: const Icon(Icons.person_add),),
            ],
          ),
          const SizedBox(height: 40,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton.icon(onPressed: () {shareLink;}, label: const Text('Send link to join family'), icon: const Icon(Icons.send_outlined)),
            ],
          ),
          
        ],
      ),
    );
  }
}