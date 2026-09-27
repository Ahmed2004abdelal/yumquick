import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yumquick/bottom_nav_bar.dart';
import 'package:yumquick/features/home/data/repos/home_repo.dart';
import 'package:yumquick/features/home/data/repos/product_repo.dart';
import 'package:yumquick/features/home/logic/product%20details/product_details_cubit.dart';
import 'package:yumquick/features/home/ui/product_details_screen.dart';

import '../../features/home/data/models/products_model.dart';
import '../../features/home/logic/home/home_cubit.dart';
import 'routes.dart';
import '../di/dependency_injection.dart';
import '../../features/auth/login/ui/forgot_password_screen.dart';
import '../../features/auth/login/ui/login_screen.dart';
import '../../features/auth/repos/auth_repos.dart';
import '../../features/auth/signup/logic/signup_cubit.dart';
import '../../features/auth/signup/ui/signup_screen.dart';
import '../../features/home/ui/home_screen.dart';
import '../../features/onboarding/ui/onboarding_screen.dart';

import '../../features/auth/login/logic/login_cubit.dart';

class AppRouting {
  static Route? getRouting(RouteSettings settings) {
    switch (settings.name) {
      case Routes.onboarding:
        return MaterialPageRoute(builder: (_) => OnboardingScreen());
      case Routes.login:
        return MaterialPageRoute(
          builder: (_) => BlocProvider<LoginCubit>(
            create: (context) => LoginCubit(getIt<AuthRepos>()),
            child: LoginScreen(),
          ),
        );
      case Routes.signup:
        return MaterialPageRoute(
          builder: (_) => BlocProvider<SignupCubit>(
            create: (context) => SignupCubit(getIt<AuthRepos>()),
            child: SignupScreen(),
          ),
        );
      case Routes.forgotPassword:
        return MaterialPageRoute(builder: (_) => ForgotPasswordScreen());
      case Routes.bottomNavBar:
        return MaterialPageRoute(builder: (_) => BottomNavBar());
      // case Routes.home:
      //   return MaterialPageRoute(
      //     builder: (_) =>
      //   );
      case Routes.productDetails:
        final product = settings.arguments as ProductsModel;
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) =>
                ProductDetailsCubit(getIt<ProductRepo>(), product: product),
            child: ProductDetailsScreen(),
          ),
        );
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
