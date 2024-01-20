// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
class CustomButton extends StatelessWidget {

  final IconData icon;
  final VoidCallback ? onpressed;
  final Color bgcolor;
  const CustomButton({
    Key? key,
    required this.icon,
    this.onpressed,
    required this.bgcolor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      borderRadius: BorderRadius.circular(100),
       child: InkWell(
          onTap: onpressed,
          borderRadius: BorderRadius.circular(100),
          child: Container(
            padding: const EdgeInsets.all(6),
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
            ),
            child: Icon(
              
              icon,
              color: bgcolor,
              size: 20,
              ),
          ),
        ),
    
      );
    
  }
}
