
import 'package:get_it/get_it.dart';
import 'package:mentos_flutter/src/config/config.dart';
import 'package:mentos_flutter/src/data/repository/repository.dart';
import 'package:mentos_flutter/src/util/constant/strings.dart';

final getIt = GetIt.instance;

void setupDIConfig() {
  // 의존성 호출 시 => getIt.get<AuthRepository>();
  _setupData();
  _setupRepository();
  _setupUseCase();
}

void _setupData() {

}

void _setupRepository() {
  getIt.registerLazySingleton(() => AuthRepository(baseApiDio, baseUrl: baseUrl));
}

void _setupUseCase() {

}