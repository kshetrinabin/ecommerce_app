// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import 'package:ecommerce_app/features/product_order/resources/model/orderlist_model.dart';

class ProductOrderRepositary {
 final Dio dio;
  ProductOrderRepositary({
    required this.dio,
  });
  Future<Either<String,List<OrderList>>> fetchOrderList()async{
    try{
      final response = await dio.get("https://ecommerce-api-3sb4.onrender.com/api/orders");
      final result = List.from(response.data["results"]).map((e) => OrderList.fromMap(e)).toList();
      return Right(result);

    }on DioException catch(e){
      return Left(e.response?.data["results"] ?? "unable find orderlist");
    }catch(e){
      return Left(e.toString());
    }
  }
  
   Future<Either<String,OrderList>> fetchOrderDetails({required String orderId})async{
   try{
  
    final response = await dio.get("https://ecommerce-api-3sb4.onrender.com/api/orders/$orderId",
    );
    final result = OrderList.fromMap(response.data["results"]);
    return Right(result);
   }on DioException catch(e){
    return Left(e.response?.data["message"] ?? "unable to view order");
   }catch(e){
    return Left(e.toString());
   }
  }
}
