import 'package:flutter/material.dart';
import 'package:yumquick/core/Routing/routes.dart';
import 'package:yumquick/features/auth/login/ui/forgot_password_screen.dart';
import 'package:yumquick/features/auth/login/ui/login_screen.dart';
import 'package:yumquick/features/auth/signup/ui/signup_screen.dart';
import 'package:yumquick/features/onboarding/ui/onboarding_screen.dart';

class AppRouting {
  static Route? getRouting(RouteSettings settings) {
    switch (settings.name) {
      case Routes.onboarding:
        return MaterialPageRoute(builder: (_) => OnboardingScreen());
      case Routes.login:
        return MaterialPageRoute(builder: (_) => LoginScreen());
      case Routes.signup:
        return MaterialPageRoute(builder: (_) => SignupScreen());
      case Routes.forgotPassword:
        return MaterialPageRoute(builder: (_) => ForgotPasswordScreen());
      default:
        return MaterialPageRoute(builder: (_) => Default());
    }
  }
}

class Default extends StatelessWidget {
  const Default({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Center(child: Text("something is wrong")));
  }
}
