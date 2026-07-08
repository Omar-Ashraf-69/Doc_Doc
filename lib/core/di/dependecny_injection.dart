import 'package:dio/dio.dart';
import 'package:doc_doc/core/api/api_service.dart';
import 'package:doc_doc/core/api/dio_factory.dart';
import 'package:doc_doc/features/home/data/repos/home_repo.dart';
import 'package:doc_doc/features/home/logic/home_cubit.dart';
import 'package:doc_doc/features/login/data/repos/login_repo.dart';
import 'package:doc_doc/features/login/logic/login_cubit.dart';
import 'package:doc_doc/features/signup/data/repos/sign_up_repo.dart';
import 'package:doc_doc/features/signup/logic/sign_up_cubit.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

final getIt = GetIt.instance;

Future<void> setupGetIt() async {
  // Shared Preferences
  await _registerSharedPreferences();
  //Secure Storage
   await _registerSecureStorage();
  // Core
  await _registerCore();

  // Login
  _registerLogin();

  // Signup
  _registerSignup();

  // Home
  _registerHome();
}

Future<void> _registerSecureStorage() async {
  const flutterSecureStorage = FlutterSecureStorage();
  getIt.registerSingleton<FlutterSecureStorage>(flutterSecureStorage);
}

Future<void> _registerSharedPreferences() async {
  final prefs = await SharedPreferences.getInstance();
  getIt.registerSingleton<SharedPreferences>(prefs);
}

void _registerHome() {
  getIt.registerLazySingleton<HomeRepo>(
    () => HomeRepo(apiService: getIt<ApiService>()),
  );

  getIt.registerFactory<HomeCubit>(() => HomeCubit(repo: getIt<HomeRepo>()));
}

void _registerSignup() {
  getIt.registerLazySingleton<SignUpRepo>(
    () => SignUpRepo(apiService: getIt<ApiService>()),
  );

  getIt.registerFactory<SignUpCubit>(
    () => SignUpCubit(repo: getIt<SignUpRepo>()),
  );
}

void _registerLogin() {
  getIt.registerLazySingleton<LoginRepo>(
    () => LoginRepo(apiService: getIt<ApiService>()),
  );

  getIt.registerFactory<LoginCubit>(() => LoginCubit(repo: getIt<LoginRepo>()));
}

Future<void> _registerCore() async {
  final dio = await DioFactory.getDio();

  getIt.registerLazySingleton<Dio>(() => dio);

  getIt.registerLazySingleton<ApiService>(() => ApiService(getIt<Dio>()));
}
