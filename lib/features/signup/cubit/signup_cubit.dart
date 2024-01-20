import 'package:ecommerce_app/common/bloc/common_state.dart';
import 'package:ecommerce_app/features/login/resources/user_model.dart';
import 'package:ecommerce_app/features/login/resources/user_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpCubit extends Cubit<CommonState> {
  final UserRepositary repositary;
  SignUpCubit({required this.repositary}) : super(CommonInitialState());

  signupUser({required String name, required String email,required String password,required String address,required String phone})async{
    emit(CommonLoadingState());
    final res = await repositary.signUp(name: name, email: email, password: password, phone: phone, address: address);
    res.fold(
      (error) => emit(CommonErrorState(message: error)),
      (data) => emit(CommonSuccessState<User>(itemData: data))
    );
  }
}