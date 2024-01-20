import 'package:ecommerce_app/common/bloc/common_state.dart';
import 'package:ecommerce_app/features/home/UI/pages/product_home_screen.dart';
import 'package:ecommerce_app/features/login/UI/pages/login_screen.dart';
import 'package:ecommerce_app/splash/cubit/splash_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:page_transition/page_transition.dart';

class SplashBody extends StatelessWidget {
  const SplashBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<SplashCubit, CommonState>(
        listener: (context, state) {
          if (state is CommonSuccessState<bool>) {
            if (state.itemData) {
              Navigator.of(context).pushAndRemoveUntil(
                  PageTransition(
                      child: const ProductHomeScreen(),
                      type: PageTransitionType.fade),
                  (route) => false);
            }
           else {
            Navigator.of(context).pushAndRemoveUntil(
                PageTransition(
                    child: const LoginScreen(), type: PageTransitionType.fade),
                (route) => false);
          }
          }
        },
        
        child: const Center(
          child: FlutterLogo(
            size: 120,
          ),
        ),
      ),
    );
  }
}

  // Navigator.of(context).pushAndRemoveUntil(
  //         PageTransition(
  //           child:  , 
  //           type: PageTransitionType.fade), 
  //         (route) => false);
  //       }