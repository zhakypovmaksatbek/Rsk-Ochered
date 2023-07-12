enum ImageEnum { logo, logo2, logo3, profile, qr, appbar, ochered,banner,applogo,banner2,banner3}

extension ImageEnumExtension on ImageEnum {
  String get imagePath => 'assets/images/rsk_$name.png';
}

enum IconEnum { pencil ,money,navigate,home,onas,ochered,hom}

extension IconEnumExtension on IconEnum {
  String get iconPath => 'assets/icons/ic_$name.png';
}
