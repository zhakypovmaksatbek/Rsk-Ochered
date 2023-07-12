import 'package:flutter/material.dart';

class ProfileEditProvider with ChangeNotifier {
  String fullName = "Жамалидинов Бектур Русланович";
  String phoneNumber = "+996700121314";
  String innNumber = "22738488700234";
  final nameController = TextEditingController();
  final innController = TextEditingController();
  final phoneController = TextEditingController();

  void updateName(String value) {
    fullName = value;
    notifyListeners();
  }
   void updatePhoneNumber(String value) {
    phoneNumber = value;
    notifyListeners();
  }
   void updateInn(String value) {
    innNumber = value;
    notifyListeners();
  }
}
