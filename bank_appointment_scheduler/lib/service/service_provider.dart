import 'package:flutter/material.dart';

class ServiceProvider extends ChangeNotifier {
  bool isLoading = false;
  void changeLoading() {
    isLoading = !isLoading;
    notifyListeners();
  }
}
