import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:ecommerce_app/common/bloc/common_state.dart';
import 'package:ecommerce_app/features/dashboard/resources/product_repositary.dart';
import 'package:ecommerce_app/features/product/model/product_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ecommerce_app/features/dashboard/cubit/product_event.dart';

class FetchAllProductCubit extends Bloc<ProductEvent,CommonState> {
  final ProductRepositary productRepositary;
  FetchAllProductCubit({required this.productRepositary}) : super(CommonInitialState()){
    on<FetchAllProductEvent>((event, emit)async{
     emit(CommonLoadingState());
     final res = await productRepositary.fetchAllProduct();
     res.fold(
      (error) => emit(CommonErrorState(message: error)), 
      (data) => emit(CommonSuccessState<List<Product>>(itemData: data))
      );
  });
  on<LoadMoreEvent>((event, emit)async {
     emit(CommonLoadingState(showLoading: false));
     final _ = await productRepositary.fetchAllProduct(isLoadmore: true);
     emit(CommonSuccessState(itemData: productRepositary.products));
  },
  transformer: droppable()
  
  );
  
  }

  
}