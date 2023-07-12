import 'package:bank_appointment_scheduler/model/transaction_model.dart';
import 'package:dio/dio.dart';



class TransactionService {
  final Dio _dio;

  TransactionService() : _dio = Dio();

  Future<List<TransactionModel>> getTransactions() async {
    try {
      final response =
          await _dio.get('https://petshackaton.ru/ticket/get_transaction/');

      if (response.statusCode == 200) {
        final List<dynamic> responseData = response.data;
        final List<TransactionModel> transactions = [];

        for (var json in responseData) {
          final transaction = TransactionModel.fromJson(json);
          transactions.add(transaction);
        }

        return transactions;
      } else {
        print('API çağrısı başarısız oldu. Durum Kodu: ${response.statusCode}');
      }
    } catch (error) {
      print('API çağrısı sırasında bir hata oluştu: $error');
    }

    return [];
  }
}
