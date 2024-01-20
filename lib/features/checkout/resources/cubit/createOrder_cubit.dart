import 'package:ecommerce_app/common/bloc/common_state.dart';
import 'package:ecommerce_app/features/checkout/resources/model/createOrder_param.dart';
import 'package:ecommerce_app/features/checkout/resources/repositary/createOrder_repositary.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CreateOrderCubit extends Cubit<CommonState> {
  final OrderRepositary orderRepositary;
  CreateOrderCubit({required this.orderRepositary}) : super(CommonInitialState());

  createOrder(CreateOrderParam param)async{
    emit(CommonLoadingState());
    final res = await orderRepositary.createOrder(param);
    res.fold(
      (error) => emit(CommonErrorState(message: error)),
       (data) => emit(CommonSuccessState(itemData: null))
     );

  }
}