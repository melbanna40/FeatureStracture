import 'package:byaan/features/auth/Auth/Auth.dart';
import 'package:byaan/features/auth/signup/ui/signup_screen.dart';
import 'package:byaan/features/splash/splash_screen.dart';
import 'package:byaan/res/strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../dependencies/dependency_init.dart';
import '../features/auth/forget_password/forget_password_screen.dart';
import '../features/auth/login/ui/login_screen.dart';
import '../features/auth/login/application/login_cubit.dart';
import '../features/home/application/home_cubit/home_cubit.dart';
import '../features/test/Drawerhiden/hidendrawer.dart';

class AppRoutes {
  static Route? onGenerateRoute(RouteSettings routeSettings) {
    final args = routeSettings.arguments;

    switch (routeSettings.name) {
      case initialRoute:
        return MaterialPageRoute(builder: (_) => const SplashScreen());
      case homeRoute:
        return MaterialPageRoute(
            builder: (_) => BlocProvider(
                  create: (context) => getIt<HomeCubit>()..getHomeData(1),
                  child: const HiddenDrawer(),
                ));
      case loginRoute:
        return MaterialPageRoute(
            builder: (_) => BlocProvider(
                  create: (context) => getIt<LoginCubit>(),
                  child: const LoginScreen(),
                ));
      case signupRoute:
        return MaterialPageRoute(builder: (_) => const SignupScreen());
      case authScreen:
        return MaterialPageRoute(
            builder: (_) => BlocProvider(
                  create: (context) => getIt<LoginCubit>(),
                  child: const AuthScreen(),
                ));
      case forgetScreen:
        return MaterialPageRoute(builder: (_) => const ForgetPasswordScreen());
      default:
        return null;
    }
  }
}
