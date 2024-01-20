// import 'package:ecommerce_app/features/product_order/UI/widgets/myorder_body.dart';
// import 'package:ecommerce_app/features/product_order/resources/cubit/fetchOrder_list_cubit.dart';
// import 'package:ecommerce_app/features/product_order/resources/repositary/productOrder_repositary.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

// class MyOrderScreen extends StatelessWidget {
//   const MyOrderScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return  BlocProvider(
//       create: (context) =>FetchOrderLstCubit(
//         repositary: context.read<ProductOrderRepositary>()
//         )..fetchOrderList() ,
//       child: const MyOrderBody(),
//     );
//   }
// }
