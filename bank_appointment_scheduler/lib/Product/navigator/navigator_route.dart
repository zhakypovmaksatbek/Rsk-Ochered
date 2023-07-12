import '../../pages/general_page.dart';
import '../../pages/info.dart';

import '../../pages/splash_screen.dart';

class NavigatorRoute {
  static const paraf = '/';
  final items = {
    paraf: (context) => const SplashScreen(),
    NavigateRoutes.home.withParaf: (context) => const GeneralPage(),
    NavigateRoutes.createTicket.withParaf: (context) => const GeneralPage(),
    NavigateRoutes.info.withParaf: (context) => InfoPage(),
   // NavigateRoutes.profile.withParaf: (context) => const Profile(),
  };
}

enum NavigateRoutes {
  init,
  home,
  info,
  createTicket,
  ochered,
  profile,
  register,
  login,
  ticketDetail,
  infoDetail,
  branches,
  forgotPassword,
  newPassword
}

extension NavigateExtension on NavigateRoutes {
  String get withParaf => "/$name";
}
