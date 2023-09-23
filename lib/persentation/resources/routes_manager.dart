import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:one_click_clearer/persentation/resources/strings_manager.dart';

import '../Main/main_view.dart';
import '../forgot_password/forget_password_view.dart';
import '../login/login_View.dart';
//import '../onboarding/onboarding_view.dart';
import '../register/register_view.dart';
import '../splash/splash_view.dart';
import '../store_details/store_details_view.dart';

class Routes {
  static const String splashRoute = "/";
  static const String loginRoute = "/login";
  static const String registerRoute = "/register";
  static const String forgotPasswordRoute = "/forgetPassword";
  static const String mainRoute = "/main";
  static const String storeDetailsRoute = "/storeDetails";
  static const String onBoarding = "/onBoarding";
}

class RouteGenerator {
  static Route<dynamic> getRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.splashRoute:
        return MaterialPageRoute(builder: (_) => const SplashView());

      case Routes.forgotPasswordRoute:
        return MaterialPageRoute(builder: (_) => const ForgotPasswordView());

      case Routes.loginRoute:
        return MaterialPageRoute(builder: (_) => const LoginView());

      case Routes.mainRoute:
        return MaterialPageRoute(builder: (_) => const MainView());

      case Routes.registerRoute:
        return MaterialPageRoute(builder: (_) => const RegisterView());

      case Routes.storeDetailsRoute:
        return MaterialPageRoute(builder: (_) => const StoreDetailsView());

     // case Routes.onBoarding:
       // return MaterialPageRoute(builder: (_) => const OnBoardingView());
      default:
        return unDefiendRoute();
    }
  }

  static Route<dynamic> unDefiendRoute() {
    return MaterialPageRoute(
        builder: (_) => Scaffold(
            appBar: AppBar(
                title: const Text(
                    AppStrings.noRoutValue) // todo move to strings manager
                ),
            body: const Center(
              child: Text(AppStrings.noRoutValue),
            ) // todo move to strings manager
            ));
  }
}
