import 'package:doctor_app/presentation/contact_us/view/contact_us_view.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import '../../app/di.dart';
import '../booking/view/booking_view.dart';
import '../doctor_information/view/doctor_information_view.dart';
import '../forgot_password/view/forgot_password_view.dart';
import '../login/view/login_view.dart';
import '../main/main_view.dart';
import '../on_boarding/view/on_boarding_view.dart';
import '../register/view/register_view.dart';
import '../splash/splash_view.dart';
import 'strings_manager.dart';

class Routes {
  static const String splashRoute = "/";
  static const String loginRoute = "/login";
  static const String registerRoute = "/register";
  static const String forgotPasswordRoute = "/forgotPassword";
  static const String onBoardingRoute = "/onBoarding";
  static const String mainRoute = "/main";
  static const String bookingRoute = "/booking";
  static const String contactUSRoute = "/contactUS";
  static const String accountRoute = "/account";
  static const String doctorInformationRoute = "/doctorInformation";
}

class RouteGenerator {
  static Route<dynamic> getRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.splashRoute:
        return MaterialPageRoute(builder: (_) => const SplashView());
      case Routes.onBoardingRoute:
        return MaterialPageRoute(builder: (_) => const OnBoardingView());
      case Routes.loginRoute:
        WidgetsFlutterBinding.ensureInitialized();
        initLoginModule();
        return MaterialPageRoute(builder: (_) => const LoginView());
      case Routes.registerRoute:
        initRegisterModule();
        return MaterialPageRoute(builder: (_) => const RegisterView());
      case Routes.forgotPasswordRoute:
        initForgotPasswordModule();
        return MaterialPageRoute(builder: (_) => const ForgotPasswordView());
      case Routes.mainRoute:
        initMainModule();
        return MaterialPageRoute(builder: (_) => const MainView());
      case Routes.bookingRoute:
        initBookingModule();
        return MaterialPageRoute(builder: (_) => const BookingView());
      case Routes.contactUSRoute:
        return MaterialPageRoute(builder: (_) => const ContactUsView());
      case Routes.doctorInformationRoute:
        return MaterialPageRoute(builder: (_) => const DoctorInformationView());
      default:
        return unDefinedRoute();
    }
  }

  static Route<dynamic> unDefinedRoute() {
    return MaterialPageRoute(
        builder: (_) => Scaffold(
            appBar: AppBar(title: Text(AppStrings.noRouteFound.tr())),
            body: Center(child: Text(AppStrings.noRouteFound.tr()))));
  }
}
