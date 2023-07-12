import 'package:dio/dio.dart';

import '../model/region_model.dart';

class RegionService {
  final Dio _dio;

  RegionService() : _dio = Dio();

  Future<List<RegionModel>> getRegions() async {
    try {
      final response =
          await _dio.get('https://petshackaton.ru/ticket/get_region/');

      if (response.statusCode == 200) {
        final List<dynamic> responseData = response.data;
        final List<RegionModel> regions = [];

        for (var json in responseData) {
          final region = RegionModel.fromJson(json);
          regions.add(region);
        }

        return regions;
      } else {
        print('API çağrısı başarısız oldu. Durum Kodu: ${response.statusCode}');
      }
    } catch (error) {
      print('API çağrısı sırasında bir hata oluştu: $error');
    }

    return [];
  }
}
