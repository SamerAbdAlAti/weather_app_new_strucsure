import 'package:get_it/get_it.dart';
import 'package:weather_app/core/app/presentation/manager/service_locator/service_locator.dart';
import 'package:weather_app/feature/weather/data/local/data_sources/weather_local_data_source.dart';
import 'package:weather_app/feature/weather/domain/use_cases/get_more_information_use_case.dart';
import 'package:weather_app/feature/weather/presentation/manager/cubit/weather_cubit.dart';

import '../../../data/remote/data_sources/weather_data_source.dart';
import '../../../data/repositories/weather_repository.dart';
import '../../../domain/repositories/base_weather_repository.dart';
import '../../../domain/use_cases/get_location_from_cache_use_case.dart';
import '../../../domain/use_cases/get_weather_by_lat_lon_use_case.dart';

class WeatherServiceLocator {
  static Future<void> init({required GetIt getIt}) async {
    getIt.registerFactory(() => WeatherCubit(
        getWeatherByLatLonUseCase: getIt(),
        getLocationFromCacheUseCase: getIt(), getMoreInformationUseCase: getIt()));

    getIt.registerLazySingleton<BaseWeatherRemoteDataSource>(
        () => WeatherRemoteDataSource());
    getIt.registerLazySingleton<BaseWeatherRepository>(() => WeatherRepository(
          baseWeatherLocalDataSource: getIt(),
          baseWeatherRemoteDataSource: getIt(),
        ));

    getIt.registerLazySingleton<BaseWeatherLocalDataSource>(
        () => WeatherLocalDataSource());
    getIt.registerLazySingleton(() => GetWeatherByLatLonUseCase(getIt()));
    getIt.registerLazySingleton(() => GetLocationFromCacheUseCase(getIt()));
    getIt.registerLazySingleton(() => GetMoreInformationUseCase(getIt()));
  }
}
