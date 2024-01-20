import 'package:ecommerce_app/features/dashboard/cubit/fetch_allproduct_cubit.dart';
import 'package:ecommerce_app/features/dashboard/cubit/fetured_product_cubit.dart';
import 'package:ecommerce_app/features/dashboard/cubit/product_event.dart';
import 'package:ecommerce_app/features/dashboard/resources/product_repositary.dart';
import 'package:ecommerce_app/features/home/UI/widgets/home_screen_body.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductHomeScreen extends StatefulWidget {
  const ProductHomeScreen({super.key});

  @override
  State<ProductHomeScreen> createState() => _ProductHomeScreenState();
}

class _ProductHomeScreenState extends State<ProductHomeScreen> {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => FetchFeaturedProductCubit(
              productRepositary: context.read<ProductRepositary>())
            ..fetchFeatureProduct(),
        ),
        BlocProvider(
          create: (context) => FetchAllProductCubit(
            productRepositary: context.read<ProductRepositary>()
            )..add(FetchAllProductEvent()),
        ),
      ],
      child: const HomeBody(),
    );
  }
}
