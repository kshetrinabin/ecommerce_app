import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:ecommerce_app/features/product/model/product_model.dart';

class ProductRepositary{
  final Dio dio;
  int _currentproductPage = 1;
  int _totalProductCount = -1;
  List<Product> _product = [];
  List<Product> get products => _product;
  ProductRepositary({required this.dio});

  Future<Either<String,List<String>>> fetchProductSection()async{
   try{
  
    final response = await dio.get("https://ecommerce-api-3sb4.onrender.com/api/products/featured",
    );
    final result = List.from(response.data["results"]).map((e) => e.toString()).toList();
    return Right(result);
   }on DioException catch(e){
    return Left(e.response!.data["message"] ?? "data no available");
   }catch(e){
    return Left(e.toString());
   }
  }

  Future<Either<String,List<Product>>> fetchAllProduct({bool isLoadmore = false})async{

    if(_totalProductCount == _product.length && isLoadmore){
      return Right(_product);
    }
   try{
    if(isLoadmore){
      _currentproductPage++;
    }else{
      _currentproductPage = 1;
      _totalProductCount = -1;
      _product.clear();

    }
  
    final response = await dio.get("https://ecommerce-api-3sb4.onrender.com/api/products/",
    queryParameters: {
      "page":_currentproductPage
    }
    );
    final result = List.from(response.data["results"]).map((e) =>Product.fromMap(e)).toList();
    _product.addAll(result);
    _totalProductCount = response.data["total"];
    return Right(result);
   }on DioException catch(e){
    return Left(e.response?.data["message"] ?? "data no available");
   }catch(e){
    return Left(e.toString());
   }
  }

  Future<Either<String,Product>> fetchProductDetails({required String productID})async{
   try{
  
    final response = await dio.get("https://ecommerce-api-3sb4.onrender.com/api/products/$productID",
    );
    final result = Product.fromMap(response.data["results"]);
    return Right(result);
   }on DioException catch(e){
    return Left(e.response?.data["message"] ?? "data no available");
   }catch(e){
    return Left(e.toString());
   }
  }
}