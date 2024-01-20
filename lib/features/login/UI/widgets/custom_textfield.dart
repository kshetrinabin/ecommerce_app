// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class CustomTextField extends StatefulWidget {
  final String label;
  final String fieldname;
  final String hintText;
  final IconData icon;
  final double bottomMargin;
  final bool isPasswordField;
  final String ? initialValue;
  final TextEditingController ? controller;
  final FormFieldValidator ? validator;
   // ignore: prefer_const_constructors_in_immutables
   CustomTextField({
    Key? key,
    required this.fieldname,
    required this.label,
    required this.hintText,
    required this.icon,
    this.bottomMargin = 16,
    this.isPasswordField =false,
    this.initialValue,
    this.controller,
    this.validator
  }) : super(key: key);

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool isObscureText = true;
  @override
  Widget build(BuildContext context) {
    return Container(
      // margin: EdgeInsets.only(bottom: bottomMargin),
      padding: const EdgeInsets.only(bottom: 8,right:16,left:16,top:0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(widget.label,style: const TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 16,
          ),),
          const SizedBox(height: 8,),
           FormBuilderTextField(
              // maxLength: 10,
              name: widget.fieldname,
              initialValue: widget.initialValue,
              keyboardType: TextInputType.text,
              obscureText: widget.isPasswordField ? isObscureText : false,
              validator: widget.validator,
              controller: widget.controller,
              
              // inputFormatters: [
                
              //   FilteringTextInputFormatter.allow(RegExp(r'^[a-zA-Z0-9]+$')),
              // ],
              decoration: InputDecoration(
                // counterText: "",
                // ignore: prefer_const_constructors
                fillColor: Color.fromARGB(220, 238, 237, 237),
                filled: true,
                hintText: widget.hintText,
                hintStyle: const TextStyle(
                  fontSize: 14,
                ),
                prefixIcon: Icon(widget.icon,size: 20,),
                suffix: widget.isPasswordField ? InkWell(
                  onTap:(){
                    setState(() {
                      isObscureText = !isObscureText;
                    });
                  } , 
                  child: Icon( 
                    isObscureText ? Icons.visibility_off:
                   Icons.visibility,
                    ),
                ):
                null,
                prefixIconColor: Colors.grey,
                contentPadding: const EdgeInsets.symmetric(horizontal: 16,vertical: 12),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide: BorderSide.none,
                  
                ),
                enabledBorder: OutlineInputBorder(
                   borderRadius: BorderRadius.circular(16),
                  borderSide: BorderSide.none,
                ),
                errorBorder: OutlineInputBorder(
                   borderRadius: BorderRadius.circular(16),
                  borderSide: BorderSide.none,
                ),
                focusedBorder: OutlineInputBorder(
                   borderRadius: BorderRadius.circular(16),
                  borderSide: BorderSide.none,
                ),
                focusedErrorBorder: OutlineInputBorder(
                   borderRadius: BorderRadius.circular(16),
                  borderSide: BorderSide.none,
                )
              ),
            ),
       
        ],
      ),
    );
  }
}
