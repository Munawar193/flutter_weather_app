import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import 'data/repositories/data_repository_impl.dart';
import 'data/services/api/weather_data_source.dart';
import 'domain/repositories/domain_repository.dart';
import 'presentation/bloc/location_bloc.dart';
import 'presentation/bloc/weather_bloc.dart';
import 'domain/useCase/get_weather.dart';

final locator = GetIt.instance;

void init() {
  // STATE INJECTION
  locator.registerFactory(() => GetWeatherBloc(
        locator(),
      ));
  locator.registerFactory(() => LocationBloc());

  // USE CASE INJECTION
  locator.registerLazySingleton(() => GetWeather(locator()));

  // REPOSITORY INJECTION
  locator.registerLazySingleton<DomainRepository>(
    () => DataRepositoryImpl(dataSource: locator()),
  );

  // API INJECTION
  locator.registerLazySingleton<WeatherDataSource>(
    () => WeatherDataSourceIMPL(dio: locator()),
  );

  // EXTERNAL
  locator.registerLazySingleton(() => Dio());
}
