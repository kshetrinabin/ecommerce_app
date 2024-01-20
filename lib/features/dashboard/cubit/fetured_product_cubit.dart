import 'package:ecommerce_app/common/bloc/common_state.dart';
import 'package:ecommerce_app/features/dashboard/resources/product_repositary.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FetchFeaturedProductCubit extends Cubit<CommonState> {
  final ProductRepositary productRepositary;
  FetchFeaturedProductCubit({required this.productRepositary}) : super(CommonInitialState());

  fetchFeatureProduct()async{
    emit(CommonLoadingState());
    final res = await productRepositary.fetchProductSection();
    res.fold(
      (error) => emit(CommonErrorState(message: error)),
       (data) => emit(CommonSuccessState<List<String>>(itemData: data))
       );
  }
}