import 'package:bank_appointment_scheduler/model/area_model.dart';
import 'package:dio/dio.dart';

class AreaService {
  final Dio _dio;

  AreaService() : _dio = Dio();

  Future<List<AreaModel>> getAreas() async {
    try {
      final response =
          await _dio.get('https://petshackaton.ru/ticket/get_area/');

      if (response.statusCode == 200) {
        final List<dynamic> responseData = response.data;
        final List<AreaModel> areas = [];

        for (var json in responseData) {
          final area = AreaModel.fromJson(json);
          areas.add(area);
        }

        return areas;
      } else {
        print('API çağrısı başarısız oldu. Durum Kodu: ${response.statusCode}');
      }
    } catch (error) {
      print('API çağrısı sırasında bir hata oluştu: $error');
    }

    return [];
  }
}
