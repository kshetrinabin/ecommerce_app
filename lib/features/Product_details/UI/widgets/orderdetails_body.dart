
// import 'package:ecommerce_app/common/bloc/common_state.dart';
// import 'package:ecommerce_app/features/Product_details/UI/widgets/ProductItem_card.dart';
// import 'package:ecommerce_app/features/Product_details/UI/widgets/initialorder_card.dart';
// import 'package:ecommerce_app/features/product_order/resources/cubit/fetchOrder_details_cubit.dart';
// import 'package:ecommerce_app/features/product_order/resources/model/orderlist_model.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:fluttertoast/fluttertoast.dart';
// import 'package:loading_overlay/loading_overlay.dart';

// class OrderDetailsBody extends StatefulWidget {
//   const OrderDetailsBody({super.key});

//   @override
//   State<OrderDetailsBody> createState() => _OrderDetailsBodyState();
// }

// class _OrderDetailsBodyState extends State<OrderDetailsBody> {
//   bool isloading = false;
//   @override
//   Widget build(BuildContext context) {
//     return LoadingOverlay(
//       isLoading: isloading,
//       child: Scaffold(
//         appBar: AppBar(
//           toolbarHeight: 65,
//           centerTitle: true,
//           backgroundColor: Colors.white,
//           elevation: 0,
//           title: const Text(
//             "Order Details",
//             style: TextStyle(
//               color: Colors.black,
//               fontSize: 18,
//               fontWeight: FontWeight.w600,
//             ),
//           ),
//           leading: IconButton(
//               onPressed: () {},
//               icon: const Icon(
//                 CupertinoIcons.back,
//                 size: 25,
//                 color: Colors.black,
//               )),
//           actions: [
//             IconButton(
//                 onPressed: () {},
//                 icon: const Icon(
//                   CupertinoIcons.search,
//                   size: 25,
//                   color: Colors.black,
//                 ))
//           ],
//         ),
//         body: BlocListener<FetchOrderDetailsCubit, CommonState>(
//           listener: (context, state) {
//             if (state is CommonLoadingState) {
//               setState(() {
//                 isloading = true;
//               });
//             } else {
//               setState(() {
//                 isloading = false;
//               });
//             }

//             if(state is CommonSuccessState<String> ){
//             context.read<FetchOrderDetailsCubit>().fetchOrderDetails(
//               orderId: state.itemData
//               );  
//             }else if(state is CommonErrorState){
//               Fluttertoast.showToast(msg: state.message);
//             }
//           },
//           child: SingleChildScrollView(
//             child: BlocBuilder<FetchOrderDetailsCubit,CommonState>(
//               builder: (context, state) {
//                 if(state is CommonErrorState){
//                   return Center(
//                     child: Text(
//                       state.message
//                     ),
//                   );

//                 }else if(state is CommonSuccessState<List<OrderList>>){
//                 return Container(
//                   padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       const InitialOrderCard(),
//                       const SizedBox(
//                         height: 6,
//                       ),
//                       RichText(
//                           text: TextSpan(
//                               text: state.itemData.length.toString(),
//                               style: const TextStyle(
//                                   color: Colors.black,
//                                   fontWeight: FontWeight.w700,
//                                   fontSize: 18),
//                               // ignore: prefer_const_literals_to_create_immutables
//                               children: [
//                             const TextSpan(
//                                 text: " :Items",
//                                 style: TextStyle(color: Colors.black))
//                           ])),
//                       const SizedBox(
//                         height: 14,
//                       ),
//                       ListView.builder(
//                           itemCount: state.itemData.length,
//                           itemBuilder: (context, index) {
//                             return ProductItemCard(
//                              item: state.itemData[index]
                            
//                           );
//                           })
//                     ],
//                   ),
//                 );
//                 }else{
//                   return const Center(
//                     child: CupertinoActivityIndicator(),
//                   );
//                 }
                
//               },
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
