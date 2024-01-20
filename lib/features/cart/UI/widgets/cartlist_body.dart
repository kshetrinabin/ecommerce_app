import 'package:ecommerce_app/common/bloc/common_state.dart';
import 'package:ecommerce_app/features/cart/UI/widgets/food_cart.dart';
import 'package:ecommerce_app/features/cart/UI/widgets/simple_button.dart';
import 'package:ecommerce_app/features/cart/resources/cubit/fetchall_cartlist_cubit.dart';
import 'package:ecommerce_app/features/cart/resources/cubit/fetchtotal_cartamount_cubit.dart';
import 'package:ecommerce_app/features/cart/resources/cubit/updateCart_quantity_cubit.dart';
import 'package:ecommerce_app/features/cart/resources/model/getcart_model.dart';
import 'package:ecommerce_app/features/checkout/UI/page/checkout_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:loading_overlay/loading_overlay.dart';
import 'package:page_transition/page_transition.dart';

class CartListBody extends StatefulWidget {
  const CartListBody({super.key});

  @override
  State<CartListBody> createState() => _CartListBodyState();
}

class _CartListBodyState extends State<CartListBody> {
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    return LoadingOverlay(
      isLoading: isLoading,
      child: Scaffold(
        appBar: PreferredSize(
            preferredSize: const Size.fromHeight(90),
            child: SafeArea(
              child: Column(
                children: [
                  Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 6, vertical: 4),
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: IconButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          icon: const Icon(
                            CupertinoIcons.back,
                            size: 25,
                          )),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "Your Cart",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        BlocSelector<FetchTotalCartAmountCubit, CommonState,
                            String>(
                          selector: (state) {
                            if (state is CommonErrorState) {
                              return "N/A";
                            } else if (state is CommonSuccessState<int>) {
                              return "Rs. ${state.itemData.toString()}";
                            } else {
                              return "calculating...";
                            }
                          },
                          builder: (context, state) {
                            return RichText(
                                text: TextSpan(
                                    text: "Total :",
                                    style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w700,
                                      color: Colors.black,
                                    ),
                                    children: [
                                  // WidgetSpan(child: Icon(Icons.alarm)),
                                  TextSpan(
                                    text: state,
                                    recognizer: TapGestureRecognizer()
                                      ..onTap = () {},
                                    style: const TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w700,
                                      color: Colors.red,
                                    ),
                                  )
                                ]));
                          },
                        )
                      ],
                    ),
                  ),
                ],
              ),
            )),
        body: BlocListener<UpdateCartQuantityCubit, CommonState>(
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
           }else if(state is CommonSuccessState<Cart>){
            context.read<FetchTotalCartAmountCubit>().fetchCartTotalAmount();
           }
          },
          child: SafeArea(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(
                    height: 8,
                  ),
                  BlocBuilder<FetchAllCartListCubit, CommonState>(
                    builder: (context, state) {
                      if (state is CommonErrorState) {
                        return Center(
                          child: Text(state.message),
                        );
                      } else if (state is CommonSuccessState<List<Cart>>) {
                        return ListView.builder(
                            itemCount: state.itemData.length,
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemBuilder: (context, index) {
                              return FoodCard(
                                cart: state.itemData[index],
                              );
                            });
                      } else {
                        return const Center(
                          child: CupertinoActivityIndicator(),
                        );
                      }
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
        floatingActionButton: Container(
          // ignore: prefer_const_constructors
          padding: EdgeInsets.only(
            left: 33,
          ),
          child: MyButton(
              name: "Continue To Checkout",
              color: const Color.fromARGB(255, 237, 37, 64),
              height: 50,
              width: double.infinity,
              onpressed: () {
                Navigator.of(context).push(PageTransition(child:const  CheckoutScreen(), type: PageTransitionType.fade));
              }),
        ),
      ),
    );
  }
}
