import 'package:dio/dio.dart';
import 'package:ecommerce_app/common/utils/author_intercepter.dart';
import 'package:ecommerce_app/features/cart/resources/cubit/fetch_cart_count_cubit.dart';
import 'package:ecommerce_app/features/cart/resources/repositary/cart_repositary.dart';
import 'package:ecommerce_app/features/checkout/resources/repositary/createOrder_repositary.dart';
import 'package:ecommerce_app/features/dashboard/resources/product_repositary.dart';
import 'package:ecommerce_app/features/login/UI/pages/login_screen.dart';
import 'package:ecommerce_app/features/login/resources/user_repository.dart';
import 'package:ecommerce_app/features/product_order/resources/repositary/productOrder_repositary.dart';
import 'package:ecommerce_app/splash/splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider(
          create: (context) => UserRepositary(),
        ),
        RepositoryProvider(
          create: (context) => Dio()
            ..interceptors.add(AuthorizationIntercepter(
                userRepositary: context.read<UserRepositary>())),
        ),
        RepositoryProvider(
          create: (context) => ProductRepositary(dio: context.read<Dio>()),
        ),
        RepositoryProvider(
          create: (context) => CartRepositary(dio: context.read<Dio>()),
        ),
        RepositoryProvider(
          create: (context) => OrderRepositary(dio: context.read<Dio>()),
        ),
        RepositoryProvider(
          create: (context) => ProductOrderRepositary(dio: context.read<Dio>()),
        ),
      ],
      child: BlocProvider(
        create: (context) => FetchCartCountCubit(
          repositary: context.read<CartRepositary>()
        )..fetchCartCount(),
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            fontFamily: "Poppins",
            //  scaffoldBackgroundColor: Colors.white,
            // textTheme: GoogleFonts.pacificoTextTheme(),
          ),
          home: const LoginScreen(),
        ),
      ),
    );
  }
}
