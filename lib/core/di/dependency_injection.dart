import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:yumquick/core/networking/api_service.dart';
import 'package:yumquick/core/networking/dio_factory.dart';
import 'package:yumquick/features/auth/login/data/repo/login_repo.dart';
import 'package:yumquick/features/auth/login/logic/login_cubit.dart';
import 'package:yumquick/features/auth/signup/data/repos/signup_repo.dart';
import 'package:yumquick/features/auth/signup/logic/signup_cubit.dart';

final getIt = GetIt.instance;

Future<void> setupGetIt() async {
  // Dio & ApiService
  Dio dio = DioFactory.getDio();
  getIt.registerLazySingleton<ApiService>(() => ApiService(dio));

  // login
  getIt.registerLazySingleton<LoginRepo>(() => LoginRepo(getIt()));
  getIt.registerFactory<LoginCubit>(() => LoginCubit(getIt()));

  // signup
  getIt.registerLazySingleton<SignupRepo>(() => SignupRepo(getIt()));
  getIt.registerFactory<SignupCubit>(() => SignupCubit(getIt()));
}
