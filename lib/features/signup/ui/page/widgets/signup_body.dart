import 'package:ecommerce_app/common/bloc/common_state.dart';
import 'package:ecommerce_app/features/login/UI/pages/login_screen.dart';
import 'package:ecommerce_app/features/login/UI/widgets/custom_textfield.dart';
import 'package:ecommerce_app/features/login/resources/user_model.dart';
import 'package:ecommerce_app/features/signup/cubit/signup_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:loading_overlay/loading_overlay.dart';
import 'package:page_transition/page_transition.dart';

class SignupBody extends StatefulWidget {
  const SignupBody({super.key});

  @override
  State<SignupBody> createState() => _SignupBodyState();
}

class _SignupBodyState extends State<SignupBody> {
  bool isRemember = false;
  bool isLoading = false;
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController addressController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return LoadingOverlay(
      isLoading: isLoading,
      child: Scaffold(
        appBar: PreferredSize(
          child: SafeArea(
            child: Container(
              margin: const EdgeInsets.only(top: 20, bottom: 40),
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(Icons.close),
                    color: Colors.grey,
                  ),
                  const Text(
                    "Need some help ?",
                    style: TextStyle(
                        color: Colors.grey,
                        fontSize: 14,
                        decoration: TextDecoration.underline),
                  )
                ],
              ),
            ),
          ),
          preferredSize: const Size.fromHeight(100),
        ),
        body: BlocListener<SignUpCubit, CommonState>(
          listener: (context, state) {
          if(state is CommonLoadingState){
            setState(() {
              isLoading = true;
            });
          }else{
            setState(() {
              isLoading = false;
            });
          }

          if(state is CommonSuccessState<User>){
            Fluttertoast.showToast(msg: "Registered successfully");
            Navigator.of(context).pushAndRemoveUntil(
              PageTransition(
                child:const LoginScreen() , type:PageTransitionType.fade
              ), 
              (route) => false
            );
          }else if(state is CommonErrorState){
            Fluttertoast.showToast(msg: state.message);
          }
          },
          child: CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: Column(
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width,
                      child: const Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            "Let's Get Started",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 24,
                              height: 1.2,
                            ),
                          ),
                          Text(
                            "Sign up and we with continue",
                            style: TextStyle(
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 22,
                    ),
                    CustomTextField(
                        fieldname: "name",
                        controller: nameController,
                        label: "name",
                        hintText: "name",
                        icon: Icons.person),
                    CustomTextField(
                      fieldname: "email",
                      controller: emailController,
                      label: "email",
                      hintText: "email",
                      icon: Icons.email,
                    ),
                    CustomTextField(
                      fieldname: "password",
                      controller: passwordController,
                      label: "password",
                      hintText: "password",
                      isPasswordField: true,
                      icon: Icons.lock,
                    ),
                    CustomTextField(
                      fieldname: "phone",
                      controller: phoneController,
                      label: "phone",
                      hintText: "phone",
                      icon: Icons.phone,
                    ),
                    CustomTextField(
                      fieldname: "address",
                      controller: addressController,
                      label: "address",
                      hintText: "address",
                      icon: Icons.home,
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 16),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            "Remember me",
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Transform.scale(
                            scale: 0.6,
                            child: CupertinoSwitch(
                                activeColor: Colors.green,
                                value: isRemember,
                                onChanged: (value) {
                                  setState(() {
                                    isRemember = value;
                                  });
                                }),
                          )
                        ],
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 40),
                      child: Row(
                        children: [
                          Expanded(
                            child: Divider(
                              color: Colors.grey,
                              thickness: 1.5,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 8),
                            child: Text(
                              "Or",
                              style: TextStyle(
                                fontSize: 15,
                              ),
                            ),
                          ),
                          Expanded(
                            child: Divider(
                              color: Colors.grey,
                              thickness: 1.5,
                            ),
                          )
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    const SizedBox(
                      height: 14,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 35, vertical: 14),
                      child: MaterialButton(
                        color: const Color.fromARGB(255, 56, 134, 244),
                        minWidth: double.infinity,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 30, vertical: 14),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16)),
                        onPressed: () {
                          context.read<SignUpCubit>().signupUser(
                                name: nameController.text,
                                email: emailController.text,
                                password: passwordController.text,
                                address: addressController.text,
                                phone: phoneController.text,
                              );
                        },
                        child: const Text(
                          "Sign Up",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 4,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 40, vertical: 20),
                      child: RichText(
                          text: TextSpan(
                              text: "Already have an account ?",
                              style: const TextStyle(
                                color: Colors.grey,
                              ),
                              children: [
                            TextSpan(
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const LoginScreen()));
                                  },
                                text: " SignIn",
                                style: const TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w600,
                                ))
                          ])),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
