import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:medsearch/globals.dart';

// ignore: non_constant_identifier_names, must_be_immutable
class UploadPhotoDialog extends StatefulWidget {
  

  const UploadPhotoDialog({super.key});

  @override
  State<UploadPhotoDialog> createState() => _UploadPhotoDialogState();
}

class _UploadPhotoDialogState extends State<UploadPhotoDialog> {
  File? image;
  Future pickImage(ImageSource source) async{
    try {
      
      final image = await ImagePicker().pickImage(source: source);
      if( image == null) return;

      final imageTemporary = File(image.path);
      setState(() => this.image = imageTemporary);
    
    } on PlatformException catch (e) {
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
            image != null  ? CircleAvatar(radius: 40, backgroundImage: Image.file(image!).image,) : CircleAvatar(radius: 40,child: localUser.avatar,),
            Padding(padding: EdgeInsets.all(15)),
            Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                ElevatedButton.icon(onPressed: () => {pickImage(ImageSource.gallery)},icon: const Icon(Icons.photo_library_outlined), label: const Text('From Gallery')),
                ElevatedButton.icon(onPressed: () => {pickImage(ImageSource.camera)},icon: const Icon(Icons.add_a_photo_outlined) ,label: const Text('From Camera')),
                const SizedBox(height: 15),
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text('Close'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
    



