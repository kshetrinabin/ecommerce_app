import 'package:ecommerce_app/common/bloc/common_state.dart';
import 'package:ecommerce_app/features/product_order/resources/model/orderlist_model.dart';
import 'package:ecommerce_app/features/product_order/resources/repositary/productOrder_repositary.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FetchOrderDetailsCubit extends Cubit<CommonState> {
  final ProductOrderRepositary repositary;
  FetchOrderDetailsCubit({required this.repositary}) : super(CommonInitialState());

  fetchOrderDetails({required String orderId})async{
    emit(CommonLoadingState());
    final res = await repositary.fetchOrderDetails(orderId:orderId);
    res.fold(
      (error) => emit(CommonErrorState(message: error)),
      (data) => emit(CommonSuccessState<OrderList>(itemData:data))
    );
  }
}