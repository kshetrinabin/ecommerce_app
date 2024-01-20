
import 'package:ecommerce_app/common/bloc/common_state.dart';
import 'package:ecommerce_app/features/cart/resources/repositary/cart_repositary.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddToCartCubit extends Cubit<CommonState> {
  final CartRepositary cartRepositary;
  AddToCartCubit({required this.cartRepositary}) : super(CommonInitialState());

  addToCart({required String productID})async{
    emit(CommonLoadingState());
    final res = await cartRepositary.addTocart(productID: productID);
    res.fold(
      (error) => emit(CommonErrorState(message: error)),
       (data) => emit(CommonSuccessState<String>(itemData: productID))
       );
  }
}