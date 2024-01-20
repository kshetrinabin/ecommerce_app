import 'package:ecommerce_app/features/login/UI/widgets/splash_body.dart';
import 'package:ecommerce_app/features/login/resources/user_repository.dart';
import 'package:ecommerce_app/splash/cubit/splash_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SplashScren extends StatelessWidget {
  const SplashScren({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SplashCubit(
        repositary: context.read<UserRepositary>(),
        )..fetchUserInfo(),
      child: const SplashBody(),
    );
  }
}
