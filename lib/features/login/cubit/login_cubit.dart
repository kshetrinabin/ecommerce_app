import 'package:ecommerce_app/common/bloc/common_state.dart';
import 'package:ecommerce_app/features/login/resources/user_model.dart';
import 'package:ecommerce_app/features/login/resources/user_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginCubit extends Cubit<CommonState> {
  final UserRepositary repositary;
  LoginCubit({required this.repositary}) : super(CommonInitialState());

  login({required String email, required String password,required bool remember})async{
    emit(CommonLoadingState());
    final res = await repositary.login(email:email , password: password,remember:remember );
    res.fold(
      (error) => emit(CommonErrorState(message: error)), 
      (data) => emit(CommonSuccessState<User>(itemData: data))
      );
  }
}