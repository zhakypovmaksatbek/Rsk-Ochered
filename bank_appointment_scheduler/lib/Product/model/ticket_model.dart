class TicketModel {
  final String selectedDate;
  final String selectedTime;
  final String selectedOblast;
  final String selectedRayon;
  final String selectedCity;
  final String selectedAddress;
  final String selectedOperation;
  final List<String> selectedCategories;

  TicketModel({
    required this.selectedDate,
    required this.selectedTime,
    required this.selectedOblast,
    required this.selectedRayon,
    required this.selectedCity,
    required this.selectedAddress,
    required this.selectedOperation,
    required this.selectedCategories,
  });
  void createTicket() {
    print('Bilet oluşturuldu!');
    print('Seçili Tarih: $selectedDate');
    print('Seçili Saat: $selectedTime');
    print('Seçili Oblast: $selectedOblast');
    print('Seçili Rayon: $selectedRayon');
    print('Seçili Şehir: $selectedCity');
    print('Seçili Adres: $selectedAddress');
    print('Seçili İşlem: $selectedOperation');
  }
}
