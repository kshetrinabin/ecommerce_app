import 'package:ecommerce_app/common/bloc/common_state.dart';
import 'package:ecommerce_app/features/cart/UI/widgets/custom_button.dart';
import 'package:ecommerce_app/features/cart/resources/cubit/updateCart_quantity_cubit.dart';
import 'package:ecommerce_app/features/cart/resources/model/getcart_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FoodCard extends StatefulWidget {
  final Cart cart;
  const FoodCard({Key? key, required this.cart}) : super(key: key);

  @override
  State<FoodCard> createState() => _FoodCardState();
}

class _FoodCardState extends State<FoodCard> {
  int count = 1;
  @override
  void initState() {
    
    super.initState();
    count = widget.cart.quantity;
  }
  @override
  Widget build(BuildContext context) {
    return BlocListener<UpdateCartQuantityCubit, CommonState>(
      listener: (context, state) {
       if(state is CommonSuccessState<Cart> && state.itemData.cartId == widget.cart.cartId){
        setState(() {
          count = state.itemData.quantity;
        });
       }
      },
      child: Padding(
        // ignore: prefer_const_constructors
        padding:  EdgeInsets.only(
         left: 10,
         top: 10
        ),
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 14),
              child: Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 8, horizontal: 20),
                margin: const EdgeInsets.only(left:60),
                height: 105,
                decoration: BoxDecoration(
                  // ignore: prefer_const_constructors
                  color: Color.fromARGB(255, 217, 232, 245),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 30),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "$count x ${widget.cart.product.name}",
                              style: const TextStyle(
                                fontWeight: FontWeight.w800,
                                fontSize: 14,
                              ),
                            ),
                            Text(
                              widget.cart.product.brand,
                              style: const TextStyle(
                                color: Colors.grey,
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text(
                                  "Rs ${widget.cart.product.price}",
                                  style: const TextStyle(
                                    color: Colors.red,
                                    fontWeight: FontWeight.w700,
                                    fontSize: 16,
                                  ),
                                ),
                                const Spacer(),
                                CustomButton(
                                    icon: Icons.add,
                                    bgcolor: Colors.red,
                                    onpressed: () {
                                      context
                                          .read<UpdateCartQuantityCubit>()
                                          .updateCartQuantity(
                                              cartId: widget.cart.cartId,
                                              quantity: count + 1
                                      );
                                    }),
                                Container(
                                  margin:
                                      const EdgeInsets.only(left: 5, right: 5),
                                  child: Text(
                                    "$count",
                                    style: const TextStyle(
                                        fontWeight: FontWeight.w800),
                                  ),
                                ),
                                CustomButton(
                                    onpressed: () {
                                      if (count > 1) {
                                        context .read<UpdateCartQuantityCubit>().updateCartQuantity(
                                        cartId: widget.cart.cartId,
                                        quantity: count - 1
                                        );
                                      }
                                    },
                                    icon: Icons.remove,
                                    bgcolor: Colors.red),
                                const SizedBox(
                                  width: 6,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
                left: 0,
                bottom: 0,
                top: 0,
                child: ClipRRect(
                     borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(8),
                      bottomLeft: Radius.circular(8)
                     ),
                  child: Image.network(
                    widget.cart.product.image,
                    width: 90,
                    height: 250,
                    fit: BoxFit.cover,
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
