import 'package:ecommerce_app/common/bloc/common_state.dart';
import 'package:ecommerce_app/features/cart/resources/model/getcart_model.dart';
import 'package:ecommerce_app/features/cart/resources/repositary/cart_repositary.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UpdateCartQuantityCubit extends Cubit<CommonState> {
  final CartRepositary repositary;
  UpdateCartQuantityCubit({required this.repositary}) : super(CommonInitialState());

  updateCartQuantity({required String cartId, required int quantity})async{
    emit(CommonLoadingState());
    final res =  await repositary.updateQuantity(cartId: cartId, quantity: quantity);
    res.fold(
      (error) => emit(CommonErrorState(message: error)),
       (data) => emit(CommonSuccessState<Cart>(itemData:data))
       );
  }
}