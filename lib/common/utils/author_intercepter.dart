// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dio/dio.dart';

import 'package:ecommerce_app/features/login/resources/user_repository.dart';

class AuthorizationIntercepter extends Interceptor {
  final UserRepositary userRepositary;
  AuthorizationIntercepter({
    required this.userRepositary,
  });
  
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    if(userRepositary.token.isNotEmpty){
      options.headers.addAll(
        {
          "Authorization": "Bearer ${userRepositary.token}"
        }
      );
    }
   handler.next(options);
  }
}
