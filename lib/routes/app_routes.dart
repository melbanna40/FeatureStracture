import 'package:byaan/features/Auth/Auth/Auth.dart';
import 'package:byaan/features/Auth/signup/ui/signup_screen.dart';
import 'package:byaan/features/splash/splash_screen.dart';
import 'package:byaan/res/strings.dart';
import 'package:flutter/material.dart';

import '../features/Auth/forget_password/forget_password_screen.dart';
import '../features/Auth/login/ui/login_screen.dart';
import '../features/test/Drawerhiden/hidendrawer.dart';

class AppRoutes {
  static Route? onGenerateRoute(RouteSettings routeSettings) {
    final args = routeSettings.arguments;

    switch (routeSettings.name) {
      case initialRoute:
        return MaterialPageRoute(builder: (_) => const SplashScreen());
      case homeRoute:
        return MaterialPageRoute(builder: (_) => const HiddenDrawer());
      case loginRoute:
        return MaterialPageRoute(builder: (_) => const LoginScreen());
      case signupRoute:
        return MaterialPageRoute(builder: (_) => const SignupScreen());
      case authScreen:
        return MaterialPageRoute(builder: (_) => const AuthScreen());
      case forgetScreen:
        return MaterialPageRoute(builder: (_) => const ForgetPasswordScreen());
      default:
        return null;
    }
  }
}
