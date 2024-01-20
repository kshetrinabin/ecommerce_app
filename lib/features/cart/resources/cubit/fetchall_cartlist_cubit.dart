import 'package:ecommerce_app/common/bloc/common_state.dart';
import 'package:ecommerce_app/features/cart/resources/model/getcart_model.dart';
import 'package:ecommerce_app/features/cart/resources/repositary/cart_repositary.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FetchAllCartListCubit extends Cubit<CommonState> {
  final CartRepositary cartRepositary;
  FetchAllCartListCubit({required this.cartRepositary}) : super(CommonInitialState());

  fetchAllCartList()async{
    emit(CommonLoadingState());
    final res = await cartRepositary.fetchCartList();
    res.fold(
      (error) => emit(CommonErrorState(message: error)), 
      (data) => emit(CommonSuccessState<List<Cart>>(itemData: data))
      );
  }
}