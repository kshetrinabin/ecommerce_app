// // ignore_for_file: public_member_api_docs, sort_constructors_first
// import 'package:ecommerce_app/features/cart/resources/model/getcart_model.dart';
// import 'package:ecommerce_app/features/product_order/resources/model/orderlist_model.dart';
// import 'package:flutter/material.dart';


// class ProductItemCard extends StatelessWidget {

//  final OrderList item;
 
// const ProductItemCard({
//     Key? key,
//     required this.item,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Stack(
//       children: [
//         Padding(
//           padding: const EdgeInsets.only(bottom: 10),
//           child: Card(
//             color: const Color.fromARGB(255, 119, 119, 119),
//             elevation: 2,
//             child: Container(
//               padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 12),
//               margin:const EdgeInsets.only(left: 80) ,
//               height: 120,
//               width: double.infinity,
//               decoration: const BoxDecoration(
//                 color: Color.fromARGB(255, 247, 245, 245),
//                 borderRadius: BorderRadius.only(
//                   topRight: Radius.circular(4),
//                   bottomRight: Radius.circular(4)
//                 )
//               ),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                    Text(
//                     item.orderItems.,
//                     style: const TextStyle(
//                       color: Colors.black,
//                       fontWeight: FontWeight.w500,
//                       fontSize: 18,
//                     ),
//                   ),
//                    const Text(
//                     "Denim denim",
//                     style: TextStyle(
//                       color: Colors.grey,
//                       fontWeight: FontWeight.w400,
//                       fontSize: 16,
//                     ),
//                   ),
//                   const SizedBox(height: 10,),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       RichText(
//                         text:  TextSpan(
//                           text: "brand:",
//                           style: const TextStyle(
//                             color: Colors.grey,
//                             fontWeight: FontWeight.w400
//                           ),
//                           children: [
//                             TextSpan(
//                               text: item.orderItems.join(),
//                               style: const TextStyle(
//                                 color: Colors.black,
                                
//                               )
//                             )
//                           ]
//                         )
//                         ),
//                      RichText(
//                         text:  TextSpan(
//                           text: "categories:",
//                           style: const TextStyle(
//                             color: Colors.grey,
//                             fontWeight: FontWeight.w400
//                           ),
//                           children: [
//                             TextSpan(
//                               text: item.orderItems.join(),
//                               style: const TextStyle(
//                               color: Colors.black
                                
//                               )
//                             )
//                           ]
//                         )
//                         ),     
//                     ],
//                   ),
//                   const SizedBox(height: 10,),
//                   Row(
//                     mainAxisAlignment:MainAxisAlignment.spaceBetween,
//                     children: [
//                          RichText(
//                         text:  TextSpan(
//                           text: "Items:",
//                           style: const TextStyle(
//                             color: Colors.grey,
//                             fontWeight: FontWeight.w400
//                           ),
//                           children: [
//                             TextSpan(
//                               text: item.quantity.toString(),
//                               style: const TextStyle(
//                                 color: Colors.black,
                                
//                               )
//                             )
//                           ]
//                         )
//                         ),
//                      RichText(
//                         text: TextSpan(
//                           text: "Price:",
//                           style: const TextStyle(
//                             color: Colors.grey,
//                             fontWeight: FontWeight.w400,
//                           ),
//                           children: [
//                             TextSpan(
//                               text: item.cart.product.price.toString(),
//                               style: const TextStyle(
//                               color: Colors.black,
//                               fontWeight: FontWeight.w700,
                            
//                                 )
//                             )
//                           ]
//                         )
//                         ),
//                     ],
//                   )
//                 ],
//               ),
//             ),
//           ),
//         ),
//         Positioned(
//           top: 4,
//           left: 0,
//           bottom: 14,
//           child:ClipRRect(
//              borderRadius: const BorderRadius.only(
//             topLeft: Radius.circular(4),
//            bottomLeft: Radius.circular(4)
//               ),
//             child: Image(
           
//               width: 90,
//               image: NetworkImage("${item.cart.product.image}"),
//               fit: BoxFit.cover,
             
//             ),
//           ) 
//           )
//       ],
//     );
//   }
// }
