import 'package:dio/dio.dart';
import 'package:doc_doc/core/api/api_service.dart';
import 'package:doc_doc/core/api/dio_factory.dart';
import 'package:doc_doc/features/login/data/repos/login_repo.dart';
import 'package:doc_doc/features/login/logic/login_cubit.dart';
import 'package:doc_doc/features/signup/data/repos/sign_up_repo.dart';
import 'package:doc_doc/features/signup/logic/sign_up_cubit.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

Future<void> setupGetIt() async {
  Dio dio = await DioFactory.getDio();
  getIt.registerLazySingleton<ApiService>(() => ApiService(dio));

  // login
  getIt.registerLazySingleton<LoginRepo>(() => LoginRepo(getIt<ApiService>()));
  getIt.registerFactory<LoginCubit>(() => LoginCubit(repo: getIt<LoginRepo>()));

  // Sign Up
  getIt.registerLazySingleton<SignUpRepo>(() => SignUpRepo(apiService:  getIt<ApiService>()));
  getIt.registerFactory<SignUpCubit>(() => SignUpCubit(repo: getIt<SignUpRepo>()));

}
