import 'package:ecommerce_app/common/bloc/common_state.dart';
import 'package:ecommerce_app/features/login/resources/user_model.dart';
import 'package:ecommerce_app/features/login/resources/user_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SocialLoginCubit extends Cubit<CommonState> {
  final UserRepositary repositary;
  SocialLoginCubit({required this.repositary}) : super(CommonInitialState());

  loginViaGoogle()async{
    emit(CommonLoadingState());
    final res = await repositary.googleLogIn();
    res.fold(
      (error) => emit(CommonErrorState(message: error)),
       (data) => emit(CommonSuccessState<User>(itemData: data))
    );
  }
}