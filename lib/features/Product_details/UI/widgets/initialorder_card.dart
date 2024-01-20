import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jiffy/jiffy.dart';

class InitialOrderCard extends StatelessWidget {
  const InitialOrderCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12,vertical: 10),
      height:95,
      width:double.infinity,
      decoration: BoxDecoration(
        color:Color.fromARGB(255, 239, 233, 236),
        borderRadius: BorderRadius.circular(4)
 ),
 child: Column(
  children: [
           Row(
               mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    RichText(
                      text: const TextSpan(
                        text: "Order No: ",style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 16,
                          color: Colors.black
                          
                        ),
                        children: [
                          TextSpan(
                            text: "E653G82863753"
                          )
                        ]
                      ),
                      
                      ),
                     Text(
                      Jiffy.parseFromDateTime(DateTime.now()).format(pattern: "dd-MM-yyyy"),
                      style: const TextStyle(
                        color: Colors.grey,
                        fontWeight: FontWeight.w400,
                        fontSize: 16
                      ),
                    )
                  ],
                 ),
             const SizedBox(height: 12,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                 
                     RichText(
                      text:  const TextSpan(
                        text: "Transaction ID: ",style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 16,
                          color: Colors.grey
                          
                        ),
                        children: [
                          TextSpan(
                            text: "7373677345",
                            style: TextStyle(
                              color: Colors.black
                            )
                          )
                        ]
                      ),
                      
                      ),
                        Text(
                          "Completed",
                          style: TextStyle(
                            color: Colors.green.shade700,
                            fontSize: 16,
                            fontWeight: FontWeight.w400
                          ),
                        )
                  ],
                )
  ],
 ),
    );
  }
}