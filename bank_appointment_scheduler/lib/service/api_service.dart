import 'dart:convert';
import 'package:dio/dio.dart';

import '../model/login_model.dart';
import '../model/profile_model.dart';

class ApiService {
  final Dio dio;

  ApiService() : dio = Dio();
  static String? authToken;
  static String? refresh;

  Future<String> login(LoginModel loginModel) async {
    try {
      final response = await dio.post(
        'https://petshackaton.ru/account/login/',
        data: json.encode(loginModel.toJson()),
      );

      if (response.statusCode == 200) {
        final responseData = response.data;
        if (responseData != null &&
            responseData['refresh'] != null &&
            responseData['access'] != null) {
          ApiService.authToken = responseData['access'];
          ApiService.refresh = responseData['refresh'];
          return responseData['access'];
        } else {
          return throw Exception(
              'Giriş başarısız oldu. Hata kodu: ${response.statusCode}');
        }
      } else {
        throw Exception(
            'Giriş başarısız oldu. Hata kodu: ${response.statusCode}');
      }
    } catch (error) {
      throw Exception('Hata: $error');
    }
  }

  static var profiledata;
   Future<List<ProfileModel>> fetchUserDetails(String token) async {
  try {
    Response response = await dio.get(
      'https://petshackaton.ru/account/profile/',
      options: Options(
        headers: {'Authorization': 'Bearer $token'},
      ),
    );
    
    // İstek başarılı olduysa gelen veriyi User listesine dönüştürerek döndürün
    if (response.statusCode == 200) {
      List<dynamic> responseData = response.data;
      List<ProfileModel> users = [];
      for (var userData in responseData) {
        ProfileModel user = ProfileModel.fromJson(userData);
        users.add(user);
      }
      return users;
    } else {
      throw Exception('API isteği başarısız oldu');
    }
  } catch (error) {
    throw Exception('API isteği gerçekleştirilemedi: $error');
  }
}
}
