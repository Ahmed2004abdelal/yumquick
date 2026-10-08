import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yumquick/bottom_nav_bar.dart';
import 'package:yumquick/core/di/dependency_injection.dart';
import 'package:yumquick/core/networking/stripe_payment_service.dart';
import 'package:yumquick/features/auth/login/logic/login_cubit.dart';
import 'package:yumquick/features/auth/login/ui/forgot_password_screen.dart';
import 'package:yumquick/features/auth/login/ui/login_screen.dart';
import 'package:yumquick/features/auth/repos/auth_repos.dart';
import 'package:yumquick/features/auth/signup/logic/signup_cubit.dart';
import 'package:yumquick/features/auth/signup/ui/signup_screen.dart';
import 'package:yumquick/features/cart/data/repos/cart_repo.dart';
import 'package:yumquick/features/cart/logic/cart_cubit.dart';
import 'package:yumquick/features/cart/ui/cart_screen.dart';
import 'package:yumquick/features/checkout/data/models/checkout%20models/checkout_screen_model.dart';
import 'package:yumquick/features/checkout/data/repos/checkout_repo.dart';
import 'package:yumquick/features/checkout/logic/checkout_cubit.dart';
import 'package:yumquick/features/checkout/ui/screens/checkout_screen.dart';
import 'package:yumquick/features/checkout/ui/screens/order_confirmed_screen.dart';
import 'package:yumquick/features/checkout/ui/screens/order_payment_screen.dart';
import 'package:yumquick/features/home/data/models/products_model.dart';
import 'package:yumquick/features/home/data/repos/product_repo.dart';
import 'package:yumquick/features/home/logic/product%20details/product_details_cubit.dart';
import 'package:yumquick/features/home/ui/product_details_screen.dart';
import 'package:yumquick/features/onboarding/ui/onboarding_screen.dart';
import 'package:yumquick/features/side%20menu%20screens/data/repos/address_repo.dart';
import 'package:yumquick/features/side%20menu%20screens/data/repos/payment_repo.dart';
import 'package:yumquick/features/side%20menu%20screens/logic/address%20logic/address_cubit.dart';
import 'package:yumquick/features/side%20menu%20screens/logic/payment%20logic/payment_cubit.dart';
import 'package:yumquick/features/side%20menu%20screens/ui/screens/add_card_screen.dart';
import 'package:yumquick/features/side%20menu%20screens/ui/screens/add_new_address_screen.dart';
import 'package:yumquick/features/side%20menu%20screens/ui/screens/address_screen.dart';
import 'package:yumquick/features/side%20menu%20screens/ui/screens/payment_methods_screen.dart';

import 'routes.dart';

class AppRouting {
  const AppRouting._();

  static Route<dynamic> getRouting(RouteSettings settings) {
    switch (settings.name) {
      case Routes.onboarding:
        return _page(settings, const OnboardingScreen());

      case Routes.login:
        return _page(
          settings,
          BlocProvider<LoginCubit>(
            create: (_) => LoginCubit(getIt<AuthRepos>()),
            child: const LoginScreen(),
          ),
        );

      case Routes.signup:
        return _page(
          settings,
          BlocProvider<SignupCubit>(
            create: (_) => SignupCubit(getIt<AuthRepos>()),
            child: const SignupScreen(),
          ),
        );

      case Routes.forgotPassword:
        return _page(settings, ForgotPasswordScreen());

      case Routes.bottomNavBar:
        // arguments اختيارية: لو مفيش أو مش int يفتح على أول تاب (Home)
        final args = settings.arguments;
        final index = args is int ? args : 0;
        return _page(settings, BottomNavBar(initialIndex: index));

      case Routes.addressScreen:
        return _page(
          settings,
          BlocProvider<AddressCubit>(
            create: (_) => AddressCubit(getIt<AddressRepo>()),
            child: const AddressScreen(),
          ),
        );

      case Routes.addNewAddressScreen:
        final cubit = settings.arguments;
        if (cubit is! AddressCubit) return _unknown(settings);
        return _page(
          settings,
          BlocProvider<AddressCubit>.value(
            value: cubit,
            child: const AddNewAddressScreen(),
          ),
        );

      case Routes.paymentMethodsScreen:
        return _page(
          settings,
          BlocProvider<PaymentCubit>(
            create: (_) => PaymentCubit(
              getIt<PaymentRepo>(),
              getIt<StripePaymentService>(),
            ),
            child: const PaymentMethodsScreen(),
          ),
        );

      case Routes.addCardScreen:
        final cubit = settings.arguments;
        if (cubit is! PaymentCubit) return _unknown(settings);
        return _page(
          settings,
          BlocProvider<PaymentCubit>.value(
            value: cubit,
            child: const AddCardScreen(),
          ),
        );

      case Routes.orderConfirmedScreen:
        return _page(settings, const OrderConfirmedScreen());

      case Routes.productDetails:
        final product = settings.arguments;
        if (product is! ProductsModel) return _unknown(settings);
        return _page(
          settings,
          BlocProvider<ProductDetailsCubit>(
            create: (_) =>
                ProductDetailsCubit(getIt<ProductRepo>(), product: product),
            child: const ProductDetailsScreen(),
          ),
        );

      case Routes.cart:
        return _page(
          settings,
          BlocProvider<CartCubit>(
            create: (_) => CartCubit(getIt<CartRepo>()),
            child: const CartScreen(),
          ),
        );

      case Routes.checkout:
        final model = settings.arguments;
        if (model is! CheckoutScreenModel) return _unknown(settings);
        return _page(
          settings,
          BlocProvider<CheckoutCubit>(
            create: (_) => CheckoutCubit(
              getIt<CheckoutRepo>(),
              getIt<CartRepo>(),
              getIt<StripePaymentService>(),
              model,
            ),
            child: const CheckoutScreen(),
          ),
        );

      case Routes.orderPayment:
        final cubit = settings.arguments;
        if (cubit is! CheckoutCubit) return _unknown(settings);
        return _page(
          settings,
          BlocProvider<CheckoutCubit>.value(
            value: cubit,
            child: const OrderPaymentScreen(),
          ),
        );

      default:
        return _unknown(settings);
    }
  }

  static MaterialPageRoute<dynamic> _page(RouteSettings settings, Widget page) {
    return MaterialPageRoute(settings: settings, builder: (_) => page);
  }

  static MaterialPageRoute<dynamic> _unknown(RouteSettings settings) {
    return _page(settings, const UnknownRouteScreen());
  }
}

class UnknownRouteScreen extends StatelessWidget {
  const UnknownRouteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: Center(child: Text('Something went wrong')));
  }
}
