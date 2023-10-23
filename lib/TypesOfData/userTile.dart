import 'package:flutter/material.dart';
import 'package:medsearch/TypesOfData/user.dart';

class UserTile extends StatelessWidget {
  User user;

  UserTile({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: CircleAvatar(radius: 16,child: user.avatar,),
        ),
        
        // ignore: unnecessary_string_interpolations
        Text('${user.name}'),
      ]
      
    );
  }
}