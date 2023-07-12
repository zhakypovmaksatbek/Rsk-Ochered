
import 'package:dio/dio.dart';

import '../model/city_model.dart';

class CityService {
  final Dio _dio;

  CityService() : _dio = Dio();

  Future<List<CityModel>> getCities() async {
    try {
      final response =
          await _dio.get('https://petshackaton.ru/ticket/get_city/');

      if (response.statusCode == 200) {
        final List<dynamic> responseData = response.data;
        final List<CityModel> cities = [];

        for (var json in responseData) {
          final city = CityModel.fromJson(json);
          cities.add(city);
        }

        return cities;
      } else {
        print('API çağrısı başarısız oldu. Durum Kodu: ${response.statusCode}');
      }
    } catch (error) {
      print('API çağrısı sırasında bir hata oluştu: $error');
    }

    return [];
  }
}
