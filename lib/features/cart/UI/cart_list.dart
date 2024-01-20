// import 'package:ecommerce_app/features/cart/UI/widgets/cartlist_body.dart';
// import 'package:ecommerce_app/features/cart/resources/cubit/fetchall_cartlist_cubit.dart';
// import 'package:ecommerce_app/features/cart/resources/cubit/fetchtotal_cartamount_cubit.dart';
// import 'package:ecommerce_app/features/cart/resources/cubit/updateCart_quantity_cubit.dart';
// import 'package:ecommerce_app/features/cart/resources/repositary/cart_repositary.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

// class CartListScreen extends StatefulWidget {
//   const CartListScreen({super.key});

//   @override
//   State<CartListScreen> createState() => _CartListScreenState();
// }

// class _CartListScreenState extends State<CartListScreen> {
//   @override
//   Widget build(BuildContext context) {
//     return MultiBlocProvider(
//       providers: [
//         BlocProvider(
//           create: (context) => FetchAllCartListCubit(
//               cartRepositary: context.read<CartRepositary>())
//             ..fetchAllCartList(),
//         ),
//         BlocProvider(
//           create: (context) => FetchTotalCartAmountCubit(
//             cartRepositary: context.read<CartRepositary>()
//             )..fetchCartTotalAmount(),
//         ),
//          BlocProvider(
//           create: (context) => UpdateCartQuantityCubit(
//             repositary: context.read<CartRepositary>()
//             )
//         ),
//       ],
//       child: const CartListBody(),
//     );
//   }
// }
