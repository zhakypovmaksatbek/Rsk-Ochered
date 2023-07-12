import 'package:bank_appointment_scheduler/Product/model/ticket_model.dart';
import 'package:bank_appointment_scheduler/Product/navigator/navigator_route.dart';
import 'package:bank_appointment_scheduler/pages/branches_page.dart';
import 'package:bank_appointment_scheduler/pages/create_ticket.dart';
import 'package:bank_appointment_scheduler/pages/general_page.dart';
import 'package:bank_appointment_scheduler/pages/info.dart';
import 'package:bank_appointment_scheduler/pages/info_detail_page.dart';
import 'package:bank_appointment_scheduler/pages/login/forgot_password.dart';

import 'package:bank_appointment_scheduler/pages/login/index.dart';
import 'package:bank_appointment_scheduler/pages/login/new_password.dart';
import 'package:bank_appointment_scheduler/pages/ochered.dart';
import 'package:bank_appointment_scheduler/pages/splash_screen.dart';

import 'package:bank_appointment_scheduler/pages/ticket_detail_page.dart';
import 'package:bank_appointment_scheduler/service/api_service.dart';
import 'package:flutter/material.dart';

import '../../pages/profile_page.dart';

mixin NavigatorCustom {
  Route<dynamic>? onGenerateRoute(RouteSettings routeSettings) {
    if (routeSettings.name?.isEmpty ?? true) {
      return _navigateNormal(const GeneralPage());
    }
    if (routeSettings.name == NavigatorRoute.paraf) {
      return _navigateNormal(const SplashScreen());
    }
    final routes = routeSettings.name == NavigatorRoute.paraf
        ? NavigateRoutes.home
        : NavigateRoutes.values.byName(routeSettings.name!.substring(1));
    switch (routes) {
      case NavigateRoutes.home:
        return _navigateNormal(const GeneralPage());
      case NavigateRoutes.init:
        return _navigateNormal(const GeneralPage());
      case NavigateRoutes.createTicket:
        return _navigateNormal(const CreateTicket());
      case NavigateRoutes.info:
        return _navigateNormal(InfoPage());
      // case NavigateRoutes.myTickets:
      //   return _navigateNormal(const MyTickets());

      case NavigateRoutes.profile:
        return _navigateNormal(Profile(token: ApiService.authToken ?? ""));
      case NavigateRoutes.login:
        return _navigateNormal(LoginPage());
      case NavigateRoutes.ochered:
        return _navigateNormal(Ochered());
      case NavigateRoutes.register:
        return _navigateNormal(const RegisterPage());
      case NavigateRoutes.infoDetail:
        return _navigateNormal(const InfoDetailPage());
      case NavigateRoutes.branches:
        return _navigateNormal(const BranchesPage());
      case NavigateRoutes.forgotPassword:
        return _navigateNormal(const ForgotPassword());
      case NavigateRoutes.newPassword:
        return _navigateNormal(const NewPassword());
      case NavigateRoutes.ticketDetail:
        final arguments = routeSettings.arguments as Map<String, dynamic>?;

        if (arguments != null) {
          final index = arguments['index'] as int?;
          final ticket = arguments['ticket'] as TicketModel?;

          if (index != null && ticket != null) {
            return _navigateNormal(
                TicketDetailsPage(index: index, ticket: ticket));
          }
        }

// Hata durumunda veya parametreler eksik olduğunda başka bir sayfaya yönlendirme yapılabilir.
        return _navigateNormal(const GeneralPage());
    }
  }

  Route<dynamic>? _navigateNormal(Widget child, {bool? isFullscreenDialog}) {
    return MaterialPageRoute(
        fullscreenDialog: isFullscreenDialog ?? false,
        builder: (context) {
          return child;
        });
  }
}
