import 'package:ecommerce_app/features/cart/resources/repositary/cart_repositary.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FetchCartCountCubit extends Cubit<int> {
  final CartRepositary repositary;
  FetchCartCountCubit({required this.repositary}) : super(0);

  fetchCartCount()async{
  final res = await repositary.fetchCount();
  res.fold(
    (l) => null, 
    (r) => emit(state)
  );

  }
  incrementCount(){
    emit(state + 1);
  }
  clearCount(){
    emit(0);
  }
}