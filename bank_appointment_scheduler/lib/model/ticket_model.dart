class TicketModels {
  String? owner;
  String? date;
  String? time;
  bool? status;
  String? activationCode;
  String? number;
  int? executant;
  int? region;
  int? area;
  int? category;
  int? city;
  int? department;
  int? transaction;

  TicketModels(
      {this.owner,
      this.date,
      this.time,
      this.status,
      this.activationCode,
      this.number,
      this.executant,
      this.region,
      this.area,
      this.category,
      this.city,
      this.department,
      this.transaction});

  TicketModels.fromJson(Map<String, dynamic> json) {
    owner = json['owner'];
    date = json['date'];
    time = json['time'];
    status = json['status'];
    activationCode = json['activation_code'];
    number = json['number'];
    executant = json['executant'];
    region = json['region'];
    area = json['area'];
    category = json['category'];
    city = json['city'];
    department = json['department'];
    transaction = json['transaction'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['owner'] = owner;
    data['date'] = date;
    data['time'] = time;
    data['status'] = status;
    data['activation_code'] = activationCode;
    data['number'] = number;
    data['executant'] = executant;
    data['region'] = region;
    data['area'] = area;
    data['category'] = category;
    data['city'] = city;
    data['department'] = department;
    data['transaction'] = transaction;
    return data;
  }
}
