
import 'package:get_it/get_it.dart';
import 'package:mentos_flutter/src/config/config.dart';

import 'package:mentos_flutter/src/data/data_source/data_source.dart';
import 'package:mentos_flutter/src/data/repository/repository.dart';
import 'package:mentos_flutter/src/domain/service/deep_linking_service.dart';
import 'package:mentos_flutter/src/domain/service/notification_service.dart';

import 'package:mentos_flutter/src/util/constant/strings.dart';

final getIt = GetIt.instance;

void setupDIConfig() {
  _setupData();
  _setupRepository();
  _setupService();
  _setupUseCase();
}

void _setupData() {
  getIt.registerSingleton(LocalObjectDataSource());
  getIt.registerSingleton(LocalKeyValueDataSource());
}

void _setupRepository() {
  // network
  getIt.registerLazySingleton(() => AuthRepository(baseApiDio, baseUrl: baseUrl));

  // local
}

void _setupService() {
  getIt.registerSingleton(DeepLinkingService(dataSource: getIt.get<LocalKeyValueDataSource>()));
  getIt.registerSingleton(NotificationService(deepLinkingService: getIt.get<DeepLinkingService>()));
}

void _setupUseCase() {

}