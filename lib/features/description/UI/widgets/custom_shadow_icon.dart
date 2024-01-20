// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class CustomShadowIcon extends StatelessWidget {
  final IconData icon;
  final VoidCallback onPressed;
  const CustomShadowIcon({
    Key? key,
    required this.icon,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.white,
          boxShadow:[ BoxShadow(
            
            color: Color(0xFFecedf1),
            offset: Offset(0, 0),
            spreadRadius: 6,
            blurRadius: 2,
          ),
          ],
        ),
        child: Icon(icon,color: Colors.black,),
      ),
    );
  }
}
