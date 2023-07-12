class LoginModel {
  LoginModel({
    required this.phoneNumber,
    required this.password,
  });
  late final String phoneNumber;
  late final String password;

  LoginModel.fromJson(Map<String, dynamic> json) {
    phoneNumber = json['phone_number'];
    password = json['password'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['phone_number'] = phoneNumber;
    data['password'] = password;
    return data;
  }
}
