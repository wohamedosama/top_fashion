import 'features/authentication/view/login/login_screen.dart';
import 'features/authentication/view/onboarding/onboarding.dart';
import 'utils/constants/string_router.dart';
import 'package:flutter/material.dart';

class AppRouter {
  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case onBoardingScreen:
        return MaterialPageRoute(
          builder: (context) => const OnBoardingScreen(),
        );
      case loginScreen:
        return MaterialPageRoute(
          builder: (context) => const LoginScreen(),
        );
    }
    return null;
  }
}
