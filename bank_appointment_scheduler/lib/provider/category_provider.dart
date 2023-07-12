import 'package:bank_appointment_scheduler/data/my_data.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:ntp/ntp.dart';

import '../Product/model/ticket_model.dart';

class CategoryProvider extends ChangeNotifier {
  final oblList = MyData().oblast;
  final address = MyData().address;
  final addressValue = MyData().address.values;
  final categoryModel = MyData().categories;

  String selectedObl = "oblast".tr();
  String selectedRayon = "rayon".tr();
  String selectedCity = "city".tr();
  String selectedAddress = "filial".tr();
  String selectedAddressFilial = '';
  String selectedOperation = "operation".tr();
  String bishkek = "Бишкек";
  List<String> regions = [];
  List<String> categories = [];
  Map<String, List<String>> branches = {};

  void updateRegions(String category) {
    selectedObl = category;
    regions = oblList[selectedObl] ?? [];
    notifyListeners();
  }

  void updateOperation(String category) {
    selectedOperation = category;
    categories = categoryModel[selectedOperation] ?? [];
    notifyListeners();
  }

  void deleteTicket(int index) {
    ticket.removeAt(index);
    notifyListeners();
  }

  List<String> getSelectedDistricts() {
    return regions;
  }

  String getSelectedFilialAddress() {
    return selectedAddressFilial;
  }

  List<String> getSelectedCategories() {
    return categories;
  }

  void changeSelectedCtgry(String newTitle) {
    selectedOperation = newTitle;
    notifyListeners();
  }

  void changeSelectedObl(String newTitle) {
    selectedObl = newTitle;
    notifyListeners();
  }

  void changeSelectedRyn(String newTitle) {
    selectedRayon = newTitle;
    notifyListeners();
  }

  void changeSelectedBishkek(String newTitle) {
    selectedCity = newTitle;
    notifyListeners();
  }

  void changeSelectedAddress(String newTitle) {
    selectedAddress = newTitle;
    notifyListeners();
  }

  //////
  ///
  ///
  //TakVim
  String selectedDate = DateFormat('dd MMMM').format(DateTime.now());

  Future<void> selectDate(BuildContext context) async {
    final DateTime today = DateTime.now();
    final DateTime? pickedDate = await showDatePicker(
      locale: const Locale('ru', 'RU'),
      useRootNavigator: false,
      context: context,
      initialDate: today,
      firstDate: today,
      lastDate: DateTime(today.year + 1), // İleriye 1 yıl sınırlaması
    );

    // Geçerli tarih seçildi
    selectedDate = DateFormat('dd MMMM').format(pickedDate ?? today);
    notifyListeners();
  }

  TimeOfDay defaultTime = const TimeOfDay(hour: 09, minute: 00);

  Future<void> selectedTimePicker(BuildContext context) async {
    final pickedTime = await showTimePicker(
      context: context,
      initialTime: defaultTime,
      builder: (BuildContext context, Widget? child) {
        return MediaQuery(
          data: MediaQuery.of(context).copyWith(alwaysUse24HourFormat: true),
          child: child ?? const SizedBox(),
        );
      },
    );

    if (pickedTime != null) {
      const TimeOfDay eveningBoundary = TimeOfDay(hour: 20, minute: 0);
      const TimeOfDay morningBoundary = TimeOfDay(hour: 8, minute: 0);

      if ((pickedTime.hour > eveningBoundary.hour ||
              (pickedTime.hour == eveningBoundary.hour &&
                  pickedTime.minute >= eveningBoundary.minute)) ||
          (pickedTime.hour < morningBoundary.hour ||
              (pickedTime.hour == morningBoundary.hour &&
                  pickedTime.minute <= morningBoundary.minute))) {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Text("Неверный выбор времени"),
              content: const Text("Приемы доступны только с 08:00 до 20:00"),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text('Хорошо'),
                ),
              ],
            );
          },
        );
      } else {
        defaultTime = pickedTime;
        notifyListeners();
      }
    }
  }

  ///
  ///
  List<TicketModel> ticket = [];

  ///

  ///
  ///

  String _selectedAddress = '';
  void setSelectedAddress(String address) {
    _selectedAddress = address;
    notifyListeners();
  }

  String getSelectedAddress() {
    return _selectedAddress;
  }

  String _selectedCategory = '';
  void setSelectedCategory(String category) {
    _selectedCategory = category;
    notifyListeners();
  }

  String getSelectedCategory() {
    return _selectedCategory;
  }

  String _selectedService = '';
  void setSelectedService(String service) {
    _selectedService = service;
    notifyListeners();
  }

  String getSelectedService() {
    return _selectedService;
  }

  //DateTime
  DateTime selectedDateTime = DateTime.now();
  DateTime currentTime = DateTime.now();

  int selectedHour = DateTime.now().hour;
  int selectedMinute = DateTime.now().minute;
  void setSelectedHour(int index) {
    selectedHour = index;
    notifyListeners();
  }

  Future<void> syncTime() async {
    DateTime now = await NTP.now();

    currentTime = now;
    notifyListeners();
  }

  void onSelectedItemChanged(int index) {
    selectedMinute = index * 5;
    notifyListeners();
  }

  void onSelectedDayItemChanged(int index) {
    selectedDateTime = DateTime.now().add(Duration(days: index));
    notifyListeners();
  }

  Map<String, dynamic> getTicketDetailsRouteArguments(
      int index, TicketModel ticket) {
    return {
      'index': index,
      'ticket': ticket,
    };
  }

  
}
