
// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';


class DetailsTabButton extends StatelessWidget {
  final String name;
  final Color color;
  final VoidCallback ? onpressed;
  final double ? width;
  final double ? height;
  const DetailsTabButton({
    Key? key,
    required this.name,
    required this.color,
    this.onpressed,
     this.width,
    this.height
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onpressed,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 6,vertical: 6),
        margin: const EdgeInsets.only(bottom: 7),
        height: height,
        width: width,
        decoration: BoxDecoration(
          // color:color,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: color,
            width: 2
          )
        ),
        child: Text(
          
          name,
          textAlign:TextAlign.center,
          style: const TextStyle(
            
            color: Colors.black,
            fontWeight: FontWeight.w600,
            fontSize: 16,
            
          ),
        ),
      ),
    );
  }
}
