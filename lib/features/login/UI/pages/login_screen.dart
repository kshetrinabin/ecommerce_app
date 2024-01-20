import 'package:ecommerce_app/features/login/UI/widgets/login_body.dart';
import 'package:ecommerce_app/features/login/cubit/login_cubit.dart';
import 'package:ecommerce_app/features/login/cubit/social_login_cubit.dart';
import 'package:ecommerce_app/features/login/resources/user_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => LoginCubit(
            repositary: context.read<UserRepositary>(),
          ),
        ),
        BlocProvider(
          create: (context) => SocialLoginCubit(
            repositary: context.read<UserRepositary>()
            ),
        ),
      ],
      child: const LoginBody(),
    );
  }
}
