import 'package:ecommerce_app/common/bloc/common_state.dart';
import 'package:ecommerce_app/features/cart/UI/cart_list.dart';
import 'package:ecommerce_app/features/cart/resources/cubit/fetch_cart_count_cubit.dart';
import 'package:ecommerce_app/features/dashboard/cubit/fetch_allproduct_cubit.dart';
import 'package:ecommerce_app/features/dashboard/cubit/product_event.dart';
import 'package:ecommerce_app/features/home/UI/widgets/home_feature_section.dart';
import 'package:ecommerce_app/features/home/UI/widgets/product_card.dart';
import 'package:ecommerce_app/features/login/UI/pages/login_screen.dart';
import 'package:ecommerce_app/features/login/resources/user_repository.dart';
import 'package:ecommerce_app/features/product/model/product_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:page_transition/page_transition.dart';

class HomeBody extends StatefulWidget {
  const HomeBody({super.key});

  @override
  State<HomeBody> createState() => _HomeBodyState();
}

class _HomeBodyState extends State<HomeBody> {
  final ScrollController _scrollController = ScrollController();
  @override
  Widget build(BuildContext context) {
    final userRepo = context.read<UserRepositary>();
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: PreferredSize(
            // ignore: sort_child_properties_last
            child: SafeArea(
              child: Container(
                margin: const EdgeInsets.only(left: 16, top: 15),
                child: Column(
                  children: [
                    Row(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(60),
                          child: Container(
                            height: 50,
                            width: 50,
                            child: Image.asset("assets/images/KFC1.png"),
                          ),
                        ),
                        const SizedBox(
                          width: 16,
                        ),
                        // ignore: prefer_const_constructors
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          // ignore: prefer_const_literals_to_create_immutables
                          children: [
                            Text(
                              userRepo.user?.name ?? "N/A",
                              style: const TextStyle(
                                fontSize: 14,
                              ),
                            ),
                            Text(
                              userRepo.user?.email ?? "",
                              style: const TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                              ),
                            )
                          ],
                        ),
                        SizedBox(
                          width: 18,
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => const CartListScreen()));
                          },
                          child: BlocBuilder<FetchCartCountCubit, int>(
                            builder: (context, state) {
                              return Badge.count(
                                count: state,
                                child: const Icon(CupertinoIcons.bag),
                              );
                            },
                          ),
                        ),

                        const SizedBox(
                          width: 16,
                        ),
                        IconButton(
                            onPressed: () async {
                              await context.read<UserRepositary>().logOut();
                              Navigator.of(context).pushAndRemoveUntil(
                                  PageTransition(
                                    child: const LoginScreen(),
                                    type: PageTransitionType.fade,
                                  ),
                                  (route) => false);
                            },
                            icon: const Icon(
                              Icons.logout,
                              color: Colors.red,
                            ))
                      ],
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 4),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 15, vertical: 8),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color: const Color.fromARGB(255, 228, 236, 239),
                      ),
                      child: TabBar(
                        labelColor: Colors.black,
                        unselectedLabelColor: Colors.black,
                        // indicatorSize: TabBarIndicatorSize.label,
                        indicator: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          color: Colors.white,
                        ),
                        indicatorColor: Colors.teal,
                        labelStyle: const TextStyle(
                            fontWeight: FontWeight.w800, fontSize: 16),
                        tabs: const [
                          Tab(
                            text: "Singel",
                          ),
                          Tab(
                            text: "Combo",
                          ),
                          Tab(
                            text: "Bucket",
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            preferredSize: const Size.fromHeight(150)),
        body: NotificationListener<ScrollNotification>(
          onNotification: (notification) {
            if (notification.metrics.pixels >
                    (notification.metrics.maxScrollExtent / 2) &&
                _scrollController.position.userScrollDirection ==
                    ScrollDirection.reverse) {
              context.read<FetchAllProductCubit>().add(LoadMoreEvent());
            }
            return true;
          },
          child: SingleChildScrollView(
            controller: _scrollController,
            scrollDirection: Axis.vertical,
            child: Column(
              children: [
                const Padding(
                  padding: EdgeInsets.only(
                    left: 20,
                    right: 30,
                    top: 12,
                  ),
                  child: HomeFeatureSecion(),
                ),
                BlocBuilder<FetchAllProductCubit, CommonState>(
                    buildWhen: (previous, current) {
                  if (current is CommonLoadingState) {
                    return current.showLoading;
                  } else {
                    return true;
                  }
                }, builder: (context, state) {
                  if (state is CommonErrorState) {
                    return Center(
                      child: Text(state.message),
                    );
                  } else if (state is CommonSuccessState<List<Product>>) {
                    return GridView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: state.itemData.length,
                        padding: const EdgeInsets.symmetric(horizontal: 12),
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          mainAxisExtent: 220,
                          mainAxisSpacing: 22,
                          crossAxisSpacing: 12,
                        ),
                        itemBuilder: ((context, index) {
                          return ProductCard(
                            product: state.itemData[index],
                          );
                        }));
                  } else {
                    return const Center(
                      child: CupertinoActivityIndicator(),
                    );
                  }
                }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
