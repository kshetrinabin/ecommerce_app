// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:ecommerce_app/common/bloc/common_state.dart';
import 'package:ecommerce_app/features/cart/resources/cubit/addtocart_cubit.dart';
import 'package:ecommerce_app/features/cart/resources/cubit/fetch_cart_count_cubit.dart';
import 'package:ecommerce_app/features/description/UI/widgets/custom_shadow_icon.dart';
import 'package:ecommerce_app/features/description/cubit/product_details_cubit.dart';
import 'package:ecommerce_app/features/product/model/product_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:loading_overlay/loading_overlay.dart';
import 'package:readmore/readmore.dart';

class ProductDetailsBody extends StatefulWidget {
  const ProductDetailsBody({super.key});

  @override
  State<ProductDetailsBody> createState() => _ProductDetailsBodyState();
}

class _ProductDetailsBodyState extends State<ProductDetailsBody> {
  bool isloading = false;
  @override
  Widget build(BuildContext context) {
    return LoadingOverlay(
      isLoading: isloading,
      child: Scaffold(
        appBar: PreferredSize(
            // ignore: sort_child_properties_last
            child: SafeArea(
              child: Container(
                padding: const EdgeInsets.only(
                    top: 18, bottom: 12, right: 0, left: 16),
                child: Row(
                  // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomShadowIcon(
                        icon: Icons.arrow_back,
                        onPressed: () {
                          Navigator.of(context).pop();
                        }),
                    const SizedBox(
                      width: 90,
                    ),
                    const Text(
                      "Details",
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w700,
                        fontSize: 20,
                      ),
                    ),
                    const SizedBox(
                      width: 65,
                    ),
                    CustomShadowIcon(
                        icon: Icons.favorite_border_outlined, onPressed: () {}),
                    const SizedBox(
                      width: 6,
                    )
                  ],
                ),
              ),
            ),
            preferredSize: const Size.fromHeight(80)),
        body: BlocListener<AddToCartCubit, CommonState>(
          listener: (context, state) {
          if(state is CommonLoadingState){
            setState(() {
              isloading = true;
            });
          }else{
            setState(() {
              isloading = false;
            });
          }

          if(state is CommonSuccessState<String>){
            context.read<ProductDetailsCubit>().fetchProductDetails(
              productID: state.itemData
              );
            Fluttertoast.showToast(msg: "Product is added successfully");
            context.read<FetchCartCountCubit>().incrementCount();
          }else if(state is CommonErrorState){
            Fluttertoast.showToast(msg:state.message );
          }
          },
          child: SingleChildScrollView(
            child: BlocBuilder<ProductDetailsCubit, CommonState>(
              builder: (context, state) {
                if (state is CommonErrorState) {
                  return Center(
                    child: Text(state.message),
                  );
                } else if (state is CommonSuccessState<Product>) {
                  return Container(
                    padding: const EdgeInsets.symmetric(horizontal: 18),
                    child: Column(
                      children: [
                        Image.network(
                          state.itemData.image,
                          height: 350,
                          width: double.infinity,
                          fit: BoxFit.contain,
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: Text(state.itemData.name,
                                  // ignore: prefer_const_constructors
                                  style: TextStyle(
                                    fontWeight: FontWeight.w800,
                                    fontSize: 20,
                                  )),
                            ),
                            RichText(
                                text: const TextSpan(
                                    text: "",
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w700,
                                    ),
                                    children: [
                                  WidgetSpan(
                                      child: Icon(
                                    Icons.star,
                                    color: Colors.blue,
                                  )),
                                  TextSpan(
                                    text: "4.5",
                                  ),
                                  TextSpan(
                                      text: " (454 Reviews)",
                                      style: TextStyle(
                                        color: Colors.grey,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w600,
                                      ))
                                ]))
                          ],
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(vertical: 18),
                          child: ReadMoreText(
                            state.itemData.description,
                            trimLines: 4,
                            colorClickableText: Colors.pink,
                            trimMode: TrimMode.Line,
                            trimCollapsedText: 'Read more',
                            trimExpandedText: 'Read less',
                            moreStyle: const TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w700,
                                color: Colors.blue),
                          ),
                        ),
                        Row(
                          children: [
                            PropertiesCard(
                                title: "Brand", value: state.itemData.brand),
                                // ignore: prefer_const_constructors
                                SizedBox(width: 30,),
                            // PropertiesCard(
                            //     title: "Price",
                            //     value: state.itemData.price.toString()),
                            PropertiesCard(
                                title: "Categories",
                                value: state.itemData.catagories.join(", ")),
                          ],
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(vertical: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                               Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    "Price",
                                    style: TextStyle(
                                        fontSize: 16,
                                        color: Colors.black,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  Text(
                                     "Rs ${state.itemData.price.toString()}",
                                    style: const TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                              MaterialButton(
                                onPressed: () {
                               if(state.itemData.addedInCart == false)
                                  // ignore: curly_braces_in_flow_control_structures
                                  context.read<AddToCartCubit>()
                                    .addToCart(productID: state.itemData.id);
                                },
                                color: Colors.teal,
                                minWidth: 180,
                                elevation: 0,
                                padding: const EdgeInsets.symmetric(
                                horizontal: 24, vertical: 16
                                ),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(50),
                                ),
                                child: const Text(
                                  "Add to Cart",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                  ),
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  );
                } else {
                  return const Center(
                    child: CupertinoActivityIndicator(),
                  );
                }
              },
            ),
          ),
        ),
      ),
    );
  }
}

class PropertiesCard extends StatelessWidget {
  final String title;
  final String value;
  const PropertiesCard({
    Key? key,
    required this.title,
    required this.value,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            color: Colors.black,
          ),
        ),
        const SizedBox(
          height: 4,
        ),
        Text(
          value,
          style: const TextStyle(
              color: Colors.black, fontSize: 16, fontWeight: FontWeight.w700),
        )
      ],
    );
  }
}
