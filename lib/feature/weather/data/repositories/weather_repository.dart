import 'package:dartz/dartz.dart';
import 'package:weather_app/core/app/presentation/manager/error/server_exception.dart';
import 'package:weather_app/core/app/presentation/manager/error/server_failure.dart';
import 'package:weather_app/feature/weather/data/remote/data_sources/weather_data_source.dart';
import 'package:weather_app/feature/weather/domain/entities/weather.dart';
import 'package:weather_app/feature/weather/domain/repositories/base_weather_repository.dart';

class WeatherRepository extends BaseWeatherRepository {
  final WeatherRemoteDataSource weatherRemoteDataSource;

  WeatherRepository(this.weatherRemoteDataSource);

  @override
  Future<Either<Failure, List<WeatherDaily>>> weatherDaily(
      {required double lat, required double lon}) async {
    final result =
        await weatherRemoteDataSource.getWeatherByLatLon(lat: lat, lon: lon);
    try {
      return Right(result);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMessageModel.message));
    }
  }
}
