import 'package:ecommerce_app/features/cart/resources/cubit/addtocart_cubit.dart';
import 'package:ecommerce_app/features/cart/resources/repositary/cart_repositary.dart';
import 'package:ecommerce_app/features/dashboard/resources/product_repositary.dart';
import 'package:ecommerce_app/features/description/UI/widgets/product_desciption_body.dart';
import 'package:ecommerce_app/features/description/cubit/product_details_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductDetails extends StatelessWidget {
  final String productID;
  const ProductDetails({super.key, required this.productID});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => ProductDetailsCubit(
              productRepositary: context.read<ProductRepositary>())
            ..fetchProductDetails(productID: productID),
        ),
        BlocProvider(
          create: (context) => AddToCartCubit(
            cartRepositary: context.read<CartRepositary>()),
        ),
      ],
      child: const ProductDetailsBody(),
    );
  }
}
