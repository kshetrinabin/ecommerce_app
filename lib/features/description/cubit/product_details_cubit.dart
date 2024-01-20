
import 'package:ecommerce_app/common/bloc/common_state.dart';
import 'package:ecommerce_app/features/dashboard/resources/product_repositary.dart';
import 'package:ecommerce_app/features/product/model/product_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductDetailsCubit extends Cubit<CommonState> {
  final ProductRepositary productRepositary;
  ProductDetailsCubit({required this.productRepositary}) : super(CommonInitialState());

  fetchProductDetails({required String productID})async{
    emit(CommonLoadingState());
    final res = await productRepositary.fetchProductDetails(productID: productID);
    res.fold(
      (error) => emit(CommonErrorState(message: error)), 
      (data) => emit(CommonSuccessState<Product>(itemData: data))
      );
  }
}