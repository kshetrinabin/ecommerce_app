import 'package:carousel_slider/carousel_slider.dart';
import 'package:ecommerce_app/common/bloc/common_state.dart';
import 'package:ecommerce_app/common/resources/assets/assets_class.dart';
import 'package:ecommerce_app/features/dashboard/cubit/fetured_product_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shimmer/shimmer.dart';

class HomeFeatureSecion extends StatefulWidget {
  const HomeFeatureSecion({super.key});

  @override
  State<HomeFeatureSecion> createState() => _HomeFeatureSecionState();
}

class _HomeFeatureSecionState extends State<HomeFeatureSecion> {
  int currentIndex = 0;
  // List<String> featureImages = [assets.FoodBanner, assets.FoodBanner];
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FetchFeaturedProductCubit, CommonState>(
      builder: (context, state) {
        if(state is CommonSuccessState<List<String>>){
           return Stack(
          children: [
            CarouselSlider.builder(
                itemCount: state.itemData.length,
                itemBuilder: (context, index, realIndex) {
                  return ClipRRect(
                    borderRadius: BorderRadius.circular(16),
                    child: FadeInImage(
                      image:NetworkImage(state.itemData[index]) ,
                      placeholder: const AssetImage(assets.placeholder),
                      fit: BoxFit.cover,
                      width: double.infinity,
                    ),
                  );
                },
                options: CarouselOptions(
                  height: 180,
                  viewportFraction: 0.92,
                  onPageChanged: (index, reason) {
                    setState(() {
                      currentIndex = index;
                    });
                  },
                )),
            Positioned(
              right: 0,
              left: 155,
              bottom: 10,
              child: Align(
                alignment: Alignment.center,
                child: Row(
                  children: List.generate(state.itemData.length, (index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 2),
                      child: Container(
                        height: 8,
                        width: 8,
                        // ignore: prefer_const_constructors
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: currentIndex == index
                              ? Colors.red
                              : Colors.grey.shade500,
                        ),
                      ),
                    );
                  }),
                ),
              ),
            )
          ],
        );
        }else if(state is CommonErrorState){
          return Center(
            child: Text(
              state.message
            ),
          );
        }
        else{
          return ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: Shimmer.fromColors(
              baseColor: Colors.grey.shade300,
              highlightColor: Colors.grey.shade100,
              child: Container(
                height: 180,
                width: MediaQuery.of(context).size.width,
                color: Colors.white,
              ), 
              
              ),
          );
          
        }
       
      },
    );
  }
}
