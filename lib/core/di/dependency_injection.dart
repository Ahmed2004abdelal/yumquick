import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:yumquick/core/networking/stripe_payment_service.dart';
import 'package:yumquick/features/cart/data/repos/cart_repo.dart';
import 'package:yumquick/features/cart/logic/cart_cubit.dart';
import 'package:yumquick/features/checkout/data/repos/checkout_repo.dart';
import 'package:yumquick/features/favorites/data/repos/favorites_repo.dart';
import 'package:yumquick/features/home/data/repos/product_repo.dart';
import 'package:yumquick/features/home/logic/home/home_cubit.dart';
import 'package:yumquick/features/side%20menu%20screens/data/repos/address_repo.dart';
import 'package:yumquick/features/side%20menu%20screens/data/repos/payment_repo.dart';
import 'package:yumquick/features/side%20menu%20screens/logic/address%20logic/address_cubit.dart';
import 'package:yumquick/features/side%20menu%20screens/logic/payment%20logic/payment_cubit.dart';

import '../networking/api_service.dart';
import '../networking/dio_factory.dart';
import '../../features/auth/login/logic/login_cubit.dart';
import '../../features/auth/repos/auth_repos.dart';
import '../../features/auth/signup/logic/signup_cubit.dart';
import '../../features/home/data/repos/home_repo.dart';

final getIt = GetIt.instance;

Future<void> setupGetIt() async {
  // Dio & ApiService
  Dio dio = DioFactory.getDio();
  getIt.registerLazySingleton<ApiService>(() => ApiService(dio));

  // Stripe
  getIt.registerLazySingleton<StripePaymentService>(
    () => StripePaymentService(),
  );

  // auth
  getIt.registerLazySingleton<AuthRepos>(() => AuthRepos(getIt()));
  getIt.registerFactory<LoginCubit>(() => LoginCubit(getIt()));
  getIt.registerFactory<SignupCubit>(() => SignupCubit(getIt()));

  //home
  getIt.registerLazySingleton<HomeRepo>(() => HomeRepo(getIt()));
  getIt.registerFactory<HomeCubit>(() => HomeCubit(getIt()));
  getIt.registerLazySingleton<ProductRepo>(() => ProductRepo(getIt()));

  //favorites
  getIt.registerLazySingleton<FavoritesRepo>(() => FavoritesRepo(getIt()));

  //cart
  getIt.registerLazySingleton<CartRepo>(() => CartRepo(getIt()));
  getIt.registerFactory<CartCubit>(() => CartCubit(getIt()));

  //checkout
  getIt.registerLazySingleton<CheckoutRepo>(() => CheckoutRepo(getIt()));
  // getIt.registerFactory<CheckoutCubit>(() => CheckoutCubit(getIt(), getIt()));

  //address
  getIt.registerLazySingleton<AddressRepo>(() => AddressRepo(getIt()));
  getIt.registerFactory<AddressCubit>(() => AddressCubit(getIt()));

  //payment
  getIt.registerFactory<PaymentCubit>(() => PaymentCubit(getIt(), getIt()));
  getIt.registerLazySingleton<PaymentRepo>(() => PaymentRepo(getIt()));
}
