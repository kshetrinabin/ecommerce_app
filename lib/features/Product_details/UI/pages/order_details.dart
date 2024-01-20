// import 'package:ecommerce_app/features/Product_details/UI/widgets/orderdetails_body.dart';
// import 'package:ecommerce_app/features/product_order/resources/cubit/fetchOrder_details_cubit.dart';
// import 'package:ecommerce_app/features/product_order/resources/repositary/productOrder_repositary.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

// class OrderDetailsScreen extends StatelessWidget {
//   final String orderId;
//   const OrderDetailsScreen({super.key,required this.orderId});

//   @override
//   Widget build(BuildContext context) {
//     return BlocProvider(
//       create: (context) => FetchOrderDetailsCubit(
//         repositary: context.read<ProductOrderRepositary>()
//         )..fetchOrderDetails(orderId:orderId),
//       child:const OrderDetailsBody(),
//     );
//   }
// }
