import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../model/register_model.dart';

class RegisterService {
  final Dio _dio;

  RegisterService() : _dio = Dio();

  Future<bool> register(
      RegisterModel registerModel, BuildContext context) async {
    try {
      final response = await _dio.post(
        'https://petshackaton.ru/account/register/',
        data: registerModel.toJson(),
      );

      // Eğer başarılı bir şekilde kayıt işlemi gerçekleştiyse
      if (response.statusCode == 200) {
        // Aktivasyon linkini mail olarak alabilir ve kullanıcıya gönderebilirsiniz
        return true;
      } else {
        final data = response.data;
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Text('Hata'),
              content: Text(data.toString()),
              actions: [
                TextButton(
                  child: const Text('Tamam'),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ],
            );
          },
        );
        // print(
        //     'Kayıt işlemi sırasında bir hata oluştu. Durum Kodu: ${response.statusCode}');
        print('Hata yanıtı: ${data.toString()}');
      }
    } catch (error) {
      print('Kayıt işlemi sırasında bir hata oluştu: $error');
    }

    return false;
  }
}
