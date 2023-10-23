import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:medsearch/TypesOfData/user.dart';
import 'package:medsearch/globals.dart';

// ignore: non_constant_identifier_names, must_be_immutable
class UploadPhotoFamilyDialog extends StatefulWidget {
  
  const UploadPhotoFamilyDialog({super.key, required});

  @override
  State<UploadPhotoFamilyDialog> createState() => _UploadPhotoFamilyDialogState();
}

class _UploadPhotoFamilyDialogState extends State<UploadPhotoFamilyDialog> {
  File? image;
  Future pickImage(ImageSource source) async{
    try {
      
      final image = await ImagePicker().pickImage(source: source);
      if( image == null) return;

      final imageTemporary = File(image.path);
      setState(() => this.image = imageTemporary);
    
    } on PlatformException catch (e) {
      // ignore: avoid_print
      print('Failed to pick image $e');
  }
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            image != null  ? CircleAvatar(radius: 40, backgroundImage: Image.file(image!).image,) : CircleAvatar(radius: 40, child: localUser.avatar,),
            
            Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                ElevatedButton.icon(onPressed: () => {pickImage(ImageSource.gallery)},icon: const Icon(Icons.photo_library_outlined), label: const Text('From Gallery')),
                ElevatedButton.icon(onPressed: () => {pickImage(ImageSource.camera)},icon: const Icon(Icons.add_a_photo_outlined) ,label: const Text('From Camera')),
                const SizedBox(height: 15),
                Row(
                  children: [
                    TextButton(
                      onPressed: () {
                        localUser.avatar = CircleAvatar(backgroundImage: Image.file(image!).image, radius: 60   ,);
                        Navigator.pop(context);
                      },
                      child: const Text('Close and save'),
                    ),
                    TextButton(
                      onPressed: () {
                        
                        Navigator.pop(context);
                      },
                      child: const Text('Discard', style: TextStyle(color: Colors.red)),
                      ),
                  ],
                ),
                
              ],
            ),
          ],
        ),
      ),
    );
  }
}
    



