// // ignore_for_file: public_member_api_docs, sort_constructors_first
// import 'package:ecommerce_app/features/Product_details/UI/pages/order_details.dart';
// import 'package:ecommerce_app/features/product_order/resources/model/orderlist_model.dart';
// import 'package:flutter/material.dart';

// import 'package:ecommerce_app/features/product_order/UI/widgets/detailsTab_button.dart';
// import 'package:jiffy/jiffy.dart';
// import 'package:page_transition/page_transition.dart';

// class OrderCard extends StatelessWidget {
//   final OrderList item;
//   const OrderCard({
//     Key? key,
//     required this.item
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
//                   child: Container(
//                     padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 12),
//                       height: 180,
//                       width:double.infinity,
//                       decoration: BoxDecoration(
//                         color: const Color(0xFFF5F5F5),
//                         borderRadius: BorderRadius.circular(8),
//                         boxShadow: [
//                           BoxShadow(
//                             spreadRadius: 2.0,
//                             offset: const Offset(1, 1),
//                             blurRadius: 2,
//                             color: Colors.grey.shade300
//                           ),
//                            BoxShadow(
//                             spreadRadius: 2.0,
//                             offset: const Offset(-1, -1),
//                             blurRadius: 2,
//                             color: Colors.grey.shade300
//                           )
//                         ]
//                       ),
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Row(
//                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     RichText(
//                       text: TextSpan(
//                         text: "Order No: ",style: const TextStyle(
//                           fontWeight: FontWeight.w600,
//                           fontSize: 14,
//                           color: Colors.black
                          
//                         ),
//                         children: [
//                           TextSpan(
//                             text: item.code
//                           )
//                         ]
//                       ),
                      
//                       ),
//                      Text(
//                       Jiffy.parseFromDateTime(item.dateOrdered).format(pattern: "dd-MM-yyyy"),
//                       style: const TextStyle(
//                         color: Colors.grey,
//                         fontWeight: FontWeight.w400,
//                         fontSize: 16
//                       ),
//                     )
//                   ],
//                  ),
//                       const SizedBox(height: 12,),
//                            RichText(
//                       text:  TextSpan(
//                         text: "Transaction ID:",style: const TextStyle(
//                           fontWeight: FontWeight.w600,
//                           fontSize: 14,
//                           color: Colors.grey
                          
//                         ),
//                         children: [
//                           TextSpan(
//                             text: item.id,
//                             style: const TextStyle(
//                               color: Colors.black
//                             )
//                           )
//                         ]
//                       ),
                      
//                       ),
//                          const SizedBox(height: 12,),
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: [
                  
//                            RichText(
//                       text:  TextSpan(
//                         text: "Quantity: ",style: const TextStyle(
//                           fontWeight: FontWeight.w600,
//                           fontSize: 16,
//                           color: Colors.grey
                          
//                         ),
//                         children: [
//                           TextSpan(
//                             text:item.quantity.toString() ,
//                             style: const TextStyle(
//                               color: Colors.black
//                             )
//                           )
//                         ]
//                       ),
                      
//                       ),
//                        RichText(
//                       text:  TextSpan(
//                         text: "Total Amount: ",style: const TextStyle(
//                           fontWeight: FontWeight.w600,
//                           fontSize: 16,
//                           color: Colors.grey
                          
//                         ),
//                         children: [
//                           TextSpan(
//                             text: "Rs ${item.totalPrice}",
//                             style: const TextStyle(
//                               color: Colors.black
//                             )
//                           )
//                         ]
//                       ),
                      
//                       ),
//                         ],
//                       ),
//                       const SizedBox(height: 24,),
//                      Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                        children: [
//                           DetailsTabButton(
//                           name: "Details",
//                            color: Colors.black,
//                            height: 40,
//                            width: 100,
//                            onpressed: () {
//                              Navigator.of(context).push(PageTransition(
//                               child: OrderDetailsScreen(
//                                 orderId: item.id
//                             ), 
//                                 type: PageTransitionType.fade
//                             ));
//                            },
//                            ),
//                         Text(
//                           item.status,
//                           style: TextStyle(
//                             color: Colors.green,
//                             fontSize: 16,
//                             fontWeight: FontWeight.w400
//                           ),
//                         )
//                        ],
//                      )
//                         ],
//                       ),
//                     ),
//     );
//   }
// }
