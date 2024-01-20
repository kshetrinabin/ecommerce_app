// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import 'package:ecommerce_app/features/checkout/resources/model/createOrder_param.dart';

class OrderRepositary {
final Dio dio;

 OrderRepositary({
    required this.dio,
  });
  Future<Either<String,void>> createOrder(CreateOrderParam param)async{

    try{
      final _ = await dio.post("https://ecommerce-api-3sb4.onrender.com/api/orders",
      data: param.toMap()
      );
    return const Right(null);
    }on DioException catch(e){
      return Left(e.response?.data["message"]?? "Unable to create order");
    }catch(e){
      return Left(e.toString());
    }
  }
}
