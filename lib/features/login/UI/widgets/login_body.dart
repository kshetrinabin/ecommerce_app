import 'package:ecommerce_app/common/bloc/common_state.dart';
import 'package:ecommerce_app/common/utils/storage_utils.dart';
import 'package:ecommerce_app/features/home/UI/pages/product_home_screen.dart';
import 'package:ecommerce_app/features/login/UI/widgets/custom_textfield.dart';
import 'package:ecommerce_app/features/login/UI/widgets/social_icon_button.dart';
import 'package:ecommerce_app/features/login/cubit/login_cubit.dart';
import 'package:ecommerce_app/features/login/cubit/social_login_cubit.dart';
import 'package:ecommerce_app/features/signup/ui/page/signup_screen.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:loading_overlay/loading_overlay.dart';
import 'package:page_transition/page_transition.dart';

class LoginBody extends StatefulWidget {
  const LoginBody({super.key});

  @override
  State<LoginBody> createState() => _LoginBodyState();
}

class _LoginBodyState extends State<LoginBody> {
  bool isRemember = false;
  bool isLoading = false;
  final TextEditingController EmailController = TextEditingController();
  final TextEditingController PasswordController = TextEditingController();

  final GlobalKey<FormBuilderState> _formKey = GlobalKey<FormBuilderState>();

  @override
  void initState() {
    super.initState();
    initializeData();
  }

  Future initializeData() async {
    final res = await StrorageUtils.getUserCrediantials;
    EmailController.text = res.email;
    PasswordController.text = res.password;
  }

  @override
  Widget build(BuildContext context) {
    return LoadingOverlay(
      isLoading: isLoading,
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(100),
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
                    "Forget your password ?",
                    style: TextStyle(
                        color: Colors.grey,
                        fontSize: 14,
                        decoration: TextDecoration.underline),
                  )
                ],
              ),
            ),
          ),
        ),
        body: BlocListener<SocialLoginCubit, CommonState>(
          listener: (context, state) {
         if (state is CommonLoadingState) {
                setState(() {
                  isLoading = true;
                });
              } else {
                setState(() {
                  isLoading = false;
                });
              }

           if (state is CommonErrorState) {
                Fluttertoast.showToast(msg: state.message);
              } else if (state is CommonSuccessState) {
                Fluttertoast.showToast(msg: "Logged in successfully");
                Navigator.of(context).pushAndRemoveUntil(
                    PageTransition(
                        child: const ProductHomeScreen(),
                        type: PageTransitionType.fade),
                    (route) => false);
              }
          
          },
          child: BlocListener<LoginCubit, CommonState>(
            listener: (context, state) {
              if (state is CommonLoadingState) {
                setState(() {
                  isLoading = true;
                });
              } else {
                setState(() {
                  isLoading = false;
                });
              }

              if (state is CommonErrorState) {
                Fluttertoast.showToast(msg: state.message);
              } else if (state is CommonSuccessState) {
                Fluttertoast.showToast(msg: "Logged in successfully");
                Navigator.of(context).pushAndRemoveUntil(
                    PageTransition(
                        child: const ProductHomeScreen(),
                        type: PageTransitionType.fade),
                    (route) => false);
              }
            },
            child: FormBuilder(
              key: _formKey,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width,
                      child: const Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            "Welcome !",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 24,
                              height: 1.2,
                            ),
                          ),
                          Text(
                            "Please enter your data to continue",
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
                      fieldname: "email",
                      controller: EmailController,
                      label: "Email",
                      hintText: "Email",
                      icon: Icons.email,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "please enter email";
                        } else if (EmailValidator.validate(value)) {
                          return null;
                        } else {
                          return "please provide valid email";
                        }
                      },
                    ),
                    CustomTextField(
                      fieldname: "password",
                      controller: PasswordController,
                      label: "Password",
                      hintText: "Password",
                      isPasswordField: true,
                      icon: Icons.lock,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "please enter password";
                        } else if (value.length < 4) {
                          return "please provide at least 8 character of password";
                        } else {
                          return null;
                        }
                      },
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
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // Icon(
                        // FontAwesomeIcons.facebook,
                        //   color: Color(0xFF3b5998),
                        //   size: 25,
                        // ),
                        // SizedBox(
                        //   width: 10,
                        // ),
                        // Icon(
                        //   FontAwesomeIcons.google,
                        //   color: Color(0xFF0F9D58),
                        //   size: 25,

                        // )
                        SocialIconButton(
                          icon: FontAwesomeIcons.facebook,
                          color: const Color(0xFF4267B2),
                          onPressed: () {},
                        ),
                        SocialIconButton(
                          icon: FontAwesomeIcons.google,
                          color: const Color(0xFF0F9D58),
                          onPressed: () {
                            context.read<SocialLoginCubit>().loginViaGoogle();
                          },
                        )
                      ],
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
                        onPressed: () async {
                          if (_formKey.currentState!.saveAndValidate()) {
                            context.read<LoginCubit>().login(
                                email: _formKey.currentState!.value["email"],
                                password:
                                    _formKey.currentState!.value["password"],
                                remember: isRemember);
                          }
                        },
                        child: const Text(
                          "Login",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                      Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 40,vertical: 8),
                  child: RichText(
                      text: TextSpan(
                          text: "not have an account ?",
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
                                        builder: (context) => const SignupScreen()));
                              },
                            text: " SignUp",
                            style: const TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w600,
                              fontSize: 16
                            ))
                      ])),
                ),
                     const SizedBox(
                      height: 25,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 40, vertical: 20),
                      child: RichText(
                          text: const TextSpan(
                              text:
                                  "By connecting your account confirm that you agree with our",
                              style: TextStyle(
                                color: Colors.grey,
                              ),
                              children: [
                            TextSpan(
                                text: " Terms and Condition",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w600,
                                ))
                          ])),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
