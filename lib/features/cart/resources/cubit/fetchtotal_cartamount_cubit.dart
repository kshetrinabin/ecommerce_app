import 'package:ecommerce_app/common/bloc/common_state.dart';
import 'package:ecommerce_app/features/cart/resources/repositary/cart_repositary.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FetchTotalCartAmountCubit extends Cubit<CommonState> {
  final CartRepositary cartRepositary;
  FetchTotalCartAmountCubit({required this.cartRepositary}) : super(CommonInitialState());

  fetchCartTotalAmount()async{
    emit(CommonLoadingState());
    final res = await cartRepositary.fetchCartTotalAmount();
    res.fold(
      (error) => emit(CommonErrorState(message: error)), 
      (data) => emit(CommonSuccessState(itemData: data))
      );
  }
}