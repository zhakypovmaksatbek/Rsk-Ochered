// ignore_for_file: public_member_api_docs, sort_constructors_first
class ProfileModel {
  int? id;
  String? lastLogin;
  bool? isSuperuser;
  String? firstName;
  bool? isStaff;
  String? dateJoined;
  String? email;
  String? password;
  String? name;
  String? lastName;
  String? otchestvo;
  String? pin;
  String? phoneNumber;
  String? profilePhoto;
  bool? isActive;
  bool? isWorker;
  String? activationCode;
  List<int>? groups;
  List<int>? userPermissions;

  ProfileModel(
      {this.id,
      this.lastLogin,
      this.isSuperuser,
      this.firstName,
      this.isStaff,
      this.dateJoined,
      this.email,
      this.password,
      this.name,
      this.lastName,
      this.otchestvo,
      this.pin,
      this.phoneNumber,
      this.profilePhoto,
      this.isActive,
      this.isWorker,
      this.activationCode,
      this.groups,
      this.userPermissions});

  ProfileModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    lastLogin = json['last_login'];
    isSuperuser = json['is_superuser'];
    firstName = json['first_name'];
    isStaff = json['is_staff'];
    dateJoined = json['date_joined'];
    email = json['email'];
    password = json['password'];
    name = json['name'];
    lastName = json['last_name'];
    otchestvo = json['otchestvo'];
    pin = json['pin'];
    phoneNumber = json['phone_number'];
    profilePhoto = json['profile_photo'];
    isActive = json['is_active'];
    isWorker = json['is_worker'];
    activationCode = json['activation_code'];
    groups = json['groups'].cast<int>();
    userPermissions = json['user_permissions'].cast<int>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['last_login'] = lastLogin;
    data['is_superuser'] = isSuperuser;
    data['first_name'] = firstName;
    data['is_staff'] = isStaff;
    data['date_joined'] = dateJoined;
    data['email'] = email;
    data['password'] = password;
    data['name'] = name;
    data['last_name'] = lastName;
    data['otchestvo'] = otchestvo;
    data['pin'] = pin;
    data['phone_number'] = phoneNumber;
    data['profile_photo'] = profilePhoto;
    data['is_active'] = isActive;
    data['is_worker'] = isWorker;
    data['activation_code'] = activationCode;
    data['groups'] = groups;
    data['user_permissions'] = userPermissions;
    return data;
  }

  @override
  String toString() {
    return 'ProfileModel(id: $id, lastLogin: $lastLogin, isSuperuser: $isSuperuser, firstName: $firstName, isStaff: $isStaff, dateJoined: $dateJoined, email: $email, password: $password, name: $name, lastName: $lastName, otchestvo: $otchestvo, pin: $pin, phoneNumber: $phoneNumber, profilePhoto: $profilePhoto, isActive: $isActive, isWorker: $isWorker, activationCode: $activationCode, groups: $groups, userPermissions: $userPermissions)';
  }
}
