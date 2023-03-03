import 'package:dartz/dartz.dart';
import 'package:weather_app/core/app/presentation/manager/error/server_exception.dart';
import 'package:weather_app/core/app/presentation/manager/error/server_failure.dart';
import 'package:weather_app/feature/weather/data/remote/data_sources/weather_data_source.dart';
import 'package:weather_app/feature/weather/domain/entities/location_cache.dart';
import 'package:weather_app/feature/weather/domain/entities/more_information.dart';
import 'package:weather_app/feature/weather/domain/entities/weather.dart';
import 'package:weather_app/feature/weather/domain/repositories/base_weather_repository.dart';

import '../local/data_sources/weather_local_data_source.dart';

class WeatherRepository extends BaseWeatherRepository {
  final BaseWeatherRemoteDataSource baseWeatherRemoteDataSource;
  final BaseWeatherLocalDataSource baseWeatherLocalDataSource;

  WeatherRepository({
    required this.baseWeatherRemoteDataSource,
    required this.baseWeatherLocalDataSource,
  });

  @override
  Future<Either<Failure, List<WeatherDaily>>> weatherDaily(
      {required double lat, required double lon}) async {
    final result = await baseWeatherRemoteDataSource.getWeatherByLatLon(
        lat: lat, lon: lon);
    try {
      return Right(result);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMessageModel.message));
    }
  }

  @override
  Future<LocationCache> getLocationFromCache() async {
    return await baseWeatherLocalDataSource.getLocationFromCache();
  }

  @override
  Future<Either<Failure, MoreInformation>> getMoreInformation({required double lat, required double lon})async {
    final result = await baseWeatherRemoteDataSource.getWeatherMoreInformation(lat: lat, lon: lon);
    try {
      return Right(result);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMessageModel.message));
    }
  }
}
