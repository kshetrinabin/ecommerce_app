
import 'package:ecommerce_app/common/bloc/common_state.dart';
import 'package:ecommerce_app/features/cart/UI/widgets/simple_button.dart';
import 'package:ecommerce_app/features/cart/resources/cubit/fetch_cart_count_cubit.dart';
import 'package:ecommerce_app/features/checkout/resources/cubit/createOrder_cubit.dart';
import 'package:ecommerce_app/features/checkout/resources/model/createOrder_param.dart';
import 'package:ecommerce_app/features/login/UI/widgets/custom_textfield.dart';
import 'package:ecommerce_app/features/login/resources/user_repository.dart';
import 'package:ecommerce_app/features/product_order/UI/pages/myorder_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:loading_overlay/loading_overlay.dart';
import 'package:page_transition/page_transition.dart';

class CheckoutBody extends StatefulWidget {
  const CheckoutBody({super.key});

  @override
  State<CheckoutBody> createState() => _CheckoutBodyState();
}

class _CheckoutBodyState extends State<CheckoutBody> {
  final GlobalKey<FormBuilderState> _formKey = GlobalKey<FormBuilderState>();
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    final userRepo = context.read<UserRepositary>();
    return LoadingOverlay(
      isLoading: isLoading,
      child: Scaffold(
        appBar: PreferredSize(
            preferredSize: const Size.fromHeight(80),
            child: SafeArea(
              child: Container(
                margin: const EdgeInsets.only(top: 8),
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                child: Row(
                  children: [
                   
                    IconButton(
                      onPressed: (){
                        Navigator.of(context).pop();
                      }, 
                      icon: const Icon(CupertinoIcons.back,size: 25,)),
                    Container(
                      padding: const EdgeInsets.only(left: 75),
                      child: const Text(
                        "Checkout",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.w500),
                      ),
                    )
                  ],
                ),
              ),
            )),
        body: BlocListener<CreateOrderCubit, CommonState>(
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

            if(state is CommonErrorState){
              Fluttertoast.showToast(msg: state.message);
            }else if(state is CommonSuccessState){
              Fluttertoast.showToast(msg: "successfuly order confirmed");
              Navigator.of(context).push(PageTransition(child: const MyOrderScreen(), type: PageTransitionType.fade));
              // Navigator.of(context).popUntil((route) => route.isFirst);
              context.read<FetchCartCountCubit>().clearCount();
            }
          },
          child: SingleChildScrollView(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: FormBuilder(
                key: _formKey,
                child: Column(
                  children: [
                    CustomTextField(
                        fieldname: "name",
                        label: "Name",
                        initialValue: userRepo.user?.name,
                        hintText: "fullname",
                        icon: Icons.person),
                    CustomTextField(
                        fieldname: "phone",
                        label: "Phone",
                        initialValue: userRepo.user?.phone,
                        hintText: "phone ",
                        icon: Icons.call),
                    CustomTextField(
                        fieldname: "address",
                        label: "Address",
                        initialValue: userRepo.user?.address,
                        hintText: "address",
                        icon: Icons.home),
                    CustomTextField(
                        fieldname: "city",
                        label: "City",
                        hintText: "city location",
                        icon: Icons.location_city),
                    const SizedBox(
                      height: 16,
                    ),
                    MyButton(
                        name: "Confirm",
                        color: const Color.fromARGB(255, 237, 37, 64),
                        height: 50,
                        width: double.infinity,
                        onpressed: () {
                          if (_formKey.currentState!.saveAndValidate()) {
                            final param = CreateOrderParam.fromMap(
                                _formKey.currentState!.value);
                            context.read<CreateOrderCubit>().createOrder(param);
                          }
                        }),
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
