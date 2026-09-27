import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:yumquick/features/home/data/repos/product_repo.dart';
import 'package:yumquick/features/home/logic/home/home_cubit.dart';

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

  // auth
  getIt.registerLazySingleton<AuthRepos>(() => AuthRepos(getIt()));
  getIt.registerFactory<LoginCubit>(() => LoginCubit(getIt()));
  getIt.registerFactory<SignupCubit>(() => SignupCubit(getIt()));

  //home
  getIt.registerLazySingleton<HomeRepo>(() => HomeRepo(getIt()));
  getIt.registerFactory<HomeCubit>(() => HomeCubit(getIt()));
  getIt.registerLazySingleton<ProductRepo>(() => ProductRepo(getIt()));
}
