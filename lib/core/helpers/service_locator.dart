import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:shop_app/core/helpers/api_service.dart';
import 'package:shop_app/feature/home/data/repos/home_repo_impl.dart';

final getIt = GetIt.instance;

void setupGetIt() {
  getIt.registerSingleton<ApiService>(ApiService(Dio()));

  getIt.registerSingleton<HomeRepoImpl>(HomeRepoImpl(getIt.get<ApiService>()));
}
