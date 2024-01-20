import 'dart:convert';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:ecommerce_app/features/login/resources/user_model.dart';

class StrorageUtils {
  static const storage = FlutterSecureStorage(
      aOptions: AndroidOptions(encryptedSharedPreferences: true));
  static const String _emailKey = "email";
  static const String _passwordKey = "password";

  static const String _tokenKey = "token";
  static const String _userKey = "user";

  static Future<void> saveUserCredientials(
      ({String email, String password}) data) async {
    await storage.write(key: _emailKey, value: data.email);
    await storage.write(key: _passwordKey, value: data.password);
  }

  static Future<({String email, String password})>
    get getUserCrediantials async {
    final email = await storage.read(key: _emailKey);
    final password = await storage.read(key: _passwordKey);
    return (email: email ?? "", password: password ?? "");
  }

  static Future<void> saveToken(String token) async {
    final instance = await SharedPreferences.getInstance();
    instance.setString(_tokenKey, token);
  }

  static Future<String> get getToken async {
    final instance = await SharedPreferences.getInstance();
    return (instance.getString(_tokenKey) ?? "");
  }

  static Future<void> deleteToken() async {
    final instance = await SharedPreferences.getInstance();
    instance.remove(_tokenKey);
  }

  static Future<void> saveUser(User user) async {
    final instance = await SharedPreferences.getInstance();
    final mappedUser = user.toMap();
    final encodedData = json.encode(mappedUser);
    instance.setString(_userKey, encodedData);
  }

  static Future<User?> get getUser async {
    final instance = await SharedPreferences.getInstance();
    final String? encodedData = instance.getString(_userKey);
    if (encodedData != null) {
      Map<String, dynamic> decodedData =
          Map<String, dynamic>.from(json.decode(encodedData));
      return User.fromMap(decodedData);
    } else {
      return null;
    }
  }

  static Future<void> deleteUser() async {
    final instance = await SharedPreferences.getInstance();
    instance.remove(_userKey);
  }
}
