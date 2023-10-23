import 'dart:ui';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:medsearch/TypesOfData/user.dart';

class HomeAvatarCard extends StatelessWidget {
  User user;

  HomeAvatarCard({super.key, required this.user});

  
  
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(radius: 34, child: user.avatar,),
        const SizedBox(height: 5,),
        Text(user.name, style: const TextStyle(color: Colors.white, fontSize: 14),)
      ],     
    );
  }
}
  