import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yumquick/core/Routing/routes.dart';
import 'package:yumquick/core/di/dependency_injection.dart';
import 'package:yumquick/features/auth/login/data/repo/login_repo.dart';
import 'package:yumquick/features/auth/login/ui/forgot_password_screen.dart';
import 'package:yumquick/features/auth/login/ui/login_screen.dart';
import 'package:yumquick/features/auth/signup/logic/signup_cubit.dart';
import 'package:yumquick/features/auth/signup/ui/signup_screen.dart';
import 'package:yumquick/features/home/ui/home_screen.dart';
import 'package:yumquick/features/onboarding/ui/onboarding_screen.dart';

import '../../features/auth/login/logic/login_cubit.dart';
import '../../features/auth/signup/data/repos/signup_repo.dart';

class AppRouting {
  static Route? getRouting(RouteSettings settings) {
    switch (settings.name) {
      case Routes.onboarding:
        return MaterialPageRoute(builder: (_) => OnboardingScreen());
      case Routes.login:
        return MaterialPageRoute(
          builder: (_) => BlocProvider<LoginCubit>(
            create: (context) => LoginCubit(getIt<LoginRepo>()),
            child: LoginScreen(),
          ),
        );
      case Routes.signup:
        return MaterialPageRoute(
          builder: (_) => BlocProvider<SignupCubit>(
            create: (context) => SignupCubit(getIt<SignupRepo>()),
            child: SignupScreen(),
          ),
        );
      case Routes.forgotPassword:
        return MaterialPageRoute(builder: (_) => ForgotPasswordScreen());
      case Routes.home:
        return MaterialPageRoute(builder: (_) => HomeScreen());
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
