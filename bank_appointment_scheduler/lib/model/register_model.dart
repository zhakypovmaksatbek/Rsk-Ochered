class RegisterModel {
  String? name;
  String? lastName;
  String? otchestvo;
  String? pin;
  String? email;
  String? password;
  String? password2;
  String? phoneNumber;

  RegisterModel(
      {this.name, 
      this.lastName,
      this.otchestvo,
      this.pin,
      this.email,
      this.password,
      this.password2,
      this.phoneNumber});

  RegisterModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    lastName = json['last_name'];
    otchestvo = json['otchestvo'];
    pin = json['pin'];
    email = json['email'];
    password = json['password'];
    password2 = json['password2'];
    phoneNumber = json['phone_number'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['last_name'] = lastName;
    data['otchestvo'] = otchestvo;
    data['pin'] = pin;
    data['email'] = email;
    data['password'] = password;
    data['password2'] = password2;
    data['phone_number'] = phoneNumber;
    return data;
  }
}
