 import 'package:ecommerce_app/common/bloc/common_state.dart';
import 'package:ecommerce_app/features/login/resources/user_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SplashCubit extends Cubit<CommonState> {
  final UserRepositary repositary;
  SplashCubit({required this.repositary}) : super(CommonInitialState());

  fetchUserInfo() async{
    emit(CommonLoadingState());
    await repositary.initialize();
    Future.delayed(const Duration(seconds: 5));
    emit(CommonSuccessState<bool>(itemData: repositary.user != null  && repositary.token.isNotEmpty),);
  
  }
}