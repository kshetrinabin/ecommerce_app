import 'package:ecommerce_app/features/login/resources/user_repository.dart';
import 'package:ecommerce_app/features/signup/cubit/signup_cubit.dart';
import 'package:ecommerce_app/features/signup/ui/page/widgets/signup_body.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  BlocProvider(
      create: (context) => SignUpCubit(
        repositary:context.read<UserRepositary>() 
    ),
      child: const SignupBody(),
    );
  }
}
