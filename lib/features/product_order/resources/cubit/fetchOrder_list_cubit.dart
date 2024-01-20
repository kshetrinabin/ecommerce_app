import 'package:ecommerce_app/common/bloc/common_state.dart';
import 'package:ecommerce_app/features/product_order/resources/model/orderlist_model.dart';
import 'package:ecommerce_app/features/product_order/resources/repositary/productOrder_repositary.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FetchOrderLstCubit extends Cubit<CommonState> {
  final ProductOrderRepositary repositary;
  FetchOrderLstCubit({required this.repositary}) : super(CommonInitialState());

  fetchOrderList()async{
    emit(CommonLoadingState());
    final res = await repositary.fetchOrderList();
    res.fold(
      (error) => emit(CommonErrorState(message: error)),
      (data) => emit(CommonSuccessState<List<OrderList>>(itemData: data))
    );
  }
}