import 'package:ecommerce_app/common/utils/storage_utils.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:ecommerce_app/features/login/resources/user_model.dart';
import 'package:google_sign_in/google_sign_in.dart';

class UserRepositary{
  User? _user;

  User? get user => _user;

  String  _token = "";

  String  get token => _token;

  Future<void> initialize()async{
  _token = await StrorageUtils.getToken;
  _user = await StrorageUtils.getUser;
  
  }
  Future<void> logOut()async{
  _token = "";
  _user = null;
  await StrorageUtils.deleteToken();
  await StrorageUtils.deleteUser();
  
  }

  Future<Either<String,User>> login({required String email, required String password,required bool remember}) async{

    try{
      final res = await Dio().post(
        "https://ecommerce-api-3sb4.onrender.com/api/auth/login",
        data: {
           "email":email ,
	         "password":password,
        }
        );
     if(remember){
      await StrorageUtils.saveUserCredientials((email: email,password: password));
     }
     final tempUser = User.fromMap(res.data["results"]);
     final String tempToken = res.data["token"];
     StrorageUtils.saveToken(tempToken);
     StrorageUtils.saveUser(tempUser);
     _user = tempUser;
     _token = tempToken;
    return  Right(tempUser);

    }on DioException catch(e){
      return Left(e.response?.data["message"].toString() ?? "unable to login");
    }catch(e){
      return Left(e.toString());
    }
  }

  Future<Either<String,User>> googleLogIn() async{
    try{
      GoogleSignIn _googleSignin = GoogleSignIn(
        scopes: ["email"]
      );
      await _googleSignin.signOut();
      final googleResponse = await _googleSignin.signIn();
      if(googleResponse != null){
        final accessToken = await googleResponse.authentication;
        final res = await Dio().post("https://ecommerce-api-3sb4.onrender.com/api/auth/login/social/google",
        data: {
          "token": accessToken.accessToken
        }
        );
      final tempUser = User.fromMap(res.data["results"]);
      final String tempToken = res.data["token"];
      StrorageUtils.saveToken(tempToken);
      StrorageUtils.saveUser(tempUser);
     _user = tempUser;
     _token = tempToken;
     return  Right(tempUser);

      }else{
        return const Left("Unable to login google");
      }
    }on DioException catch(e){
      return Left(e.response?.data["message"] ?? "unable to login google accout");
    }
    catch(e){
      return Left(e.toString());
    }
  }

Future<Either<String,User>> signUp({required String name, required String email,required String password, required String phone,required String address}) async{

    try{
      final res = await Dio().post(
        "https://ecommerce-api-3sb4.onrender.com/api/auth/register",
        data: {
          
			    "name": name,
		     	"email": email,
		    	"phone": phone,
			    "address": address,
          "password":password
        }
        );
     
     final result =  User.fromMap(res.data["results"]);
    return  Right(result);

    }on DioException catch(e){
      return Left(e.response?.data["message"].toString() ?? "unable to register");
    }catch(e){
      return Left(e.toString());
    }
  }

  
}