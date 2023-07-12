import 'package:bank_appointment_scheduler/model/department_model.dart';
import 'package:dio/dio.dart';

class DepartmentService {
  final Dio _dio;

  DepartmentService() : _dio = Dio();

  Future<List<DepatmentModel>> getDepartment() async {
    try {
      final response =
          await _dio.get('https://petshackaton.ru/ticket/get_department/');

      if (response.statusCode == 200) {
        final List<dynamic> responseData = response.data;
        final List<DepatmentModel> departments = [];

        for (var json in responseData) {
          final department = DepatmentModel.fromJson(json);
          departments.add(department);
        }

        return departments;
      } else {
        print('API çağrısı başarısız oldu. Durum Kodu: ${response.statusCode}');
      }
    } catch (error) {
      print('API çağrısı sırasında bir hata oluştu: $error');
    }

    return [];
  }
}
