// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:ecommerce_app/features/cart/resources/model/getcart_model.dart';

class CartRepositary {
  final Dio dio;
  
  CartRepositary({
    required this.dio,
  });

  Future<Either<String,void>> addTocart({required String productID})async{

    try{
  
    final _ = await dio.post("https://ecommerce-api-3sb4.onrender.com/api/cart/",
    // options:Options(
    //   headers: {
    //     "Authorization": "Bearer eyJhbGciOiJIUzI1NiJ9.eyJfaWQiOiI2NGIzZjVhMjE2NWFmZmZmOTY4MDEzMDgiLCJuYW1lIjoiU2l0YSIsImVtYWlsIjoic2l0YUBnbWFpbC5jb20iLCJwaG9uZSI6Ijk4MDk5OTk5OTkifQ.pedWeThWwVRPDHof2TcT1h5JEk_-BkipBy2tpLwsAG4"
    //   }
    // ),
    data: {
      "quantity":1,
      "product":productID
    }
    
     );
    return const Right(null);
   }on DioException catch(e){
    return Left(e.response!.data["message"] ?? "data no available");
   }catch(e){
    return Left(e.toString());
   }
  }
    Future<Either<String,List<Cart>>> fetchCartList()async{
   try{
  
    final response = await dio.get("https://ecommerce-api-3sb4.onrender.com/api/cart/",
    );
    final List<Cart> item = List.from(response.data["results"]).map((e) => Cart.fromMap(e),).toList();
    return Right(item);
   }on DioException catch(e){
    return Left(e.response!.data["message"] ?? "data no available");
   }catch(e){
    return Left(e.toString());
   }
  }

   Future<Either<String,int>> fetchCartTotalAmount()async{
   try{
  
    final response = await dio.get("https://ecommerce-api-3sb4.onrender.com/api/cart/total",
    );
    return Right(response.data["totalPrice"]);
   }on DioException catch(e){
    return Left(e.response!.data["message"] ?? "data no available");
   }catch(e){
    return Left(e.toString());
   }
  }

  Future<Either<String,Cart>> updateQuantity({required String cartId, required int quantity})async{
   try{
  
    final response = await dio.put("https://ecommerce-api-3sb4.onrender.com/api/cart/$cartId",
    data: 
      {
	   "quantity":quantity

    }
     );
    return Right(Cart.fromMap(response.data["results"]));
   }on DioException catch(e){
    return Left(e.response!.data["message"] ?? "data no available");
   }catch(e){
    return Left(e.toString());
   }
  }

  Future<Either<String,int>> fetchCount() async{
    try{
      final res = await Dio().get("https://ecommerce-api-3sb4.onrender.com/api/auth/register");
      return Right(res.data["counts"]);
    }on DioException catch(e){
      return Left(e.response?.data["message"] ?? "unable to fetch count");
    }catch(e){
      return Left(e.toString());
    }
  }
  
}
