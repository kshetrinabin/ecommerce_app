
// import 'package:ecommerce_app/common/bloc/common_state.dart';
// import 'package:ecommerce_app/features/product_order/UI/widgets/order_card.dart';
// import 'package:ecommerce_app/features/product_order/resources/cubit/fetchOrder_list_cubit.dart';
// import 'package:ecommerce_app/features/product_order/resources/model/orderlist_model.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

// class MyOrderBody extends StatelessWidget {
//   const MyOrderBody({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: PreferredSize(
//         preferredSize: const Size.fromHeight(180),
//          child: SafeArea(
//            child: Container(
//             padding: const EdgeInsets.symmetric(horizontal: 6,vertical: 8),
//              child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     IconButton(
//                       onPressed: (){},
//                        icon: const Icon(CupertinoIcons.back,size: 25,)
//                        ),
//                     IconButton(
//                       onPressed: (){},
//                        icon: const Icon(CupertinoIcons.search,size: 25,)
//                        ),
//                   ],
//                 ),
//                 Container(
//                   padding: const EdgeInsets.symmetric(horizontal: 18,vertical: 8),
//                   child: const Text(
//                     "My Orders",
//                     style: TextStyle(
//                       fontSize: 20,
//                       fontWeight: FontWeight.w700,
                           
//                     ),
//                   ),
//                 ),
           
//             const Row(
//               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//               children: [
//                 Chip(
//                   label:Text("Delivered") 
//                   ),
//                    Chip(
//                   label:Text("Processing") 
//                   ),
//                    Chip(
//                   label:Text("Cancelled") 
//                   ),
//               ],
//             ),
              
//               ],
//              ),
//            ),
//          )
//          ),
//          body: BlocBuilder<FetchOrderLstCubit, CommonState>(
//            builder: (context, state) {
//             if(state is CommonErrorState){
//               return Center(
//                 child: Text(
//                   state.message
//                 ),
//               );
//             }else if(state is CommonSuccessState<List<OrderList>>){
//                    return ListView.builder(
//                     itemCount: state.itemData.length,
//                     itemBuilder:(context,index){
//                       return OrderCard(
//                        item:state.itemData[index] ,
//                      );
//                     }
//                );

//             }else{
//               return const Center(
//                 child: CupertinoActivityIndicator(),
//               );
//             }
             
//            },
//          ),
//     );
//   }
// }