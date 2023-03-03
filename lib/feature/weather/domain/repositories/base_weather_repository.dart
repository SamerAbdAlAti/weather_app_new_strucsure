import 'package:dartz/dartz.dart';
import 'package:weather_app/feature/weather/domain/entities/weather.dart';

import '../../../../core/app/presentation/manager/error/server_failure.dart';

abstract class BaseWeatherRepository {
  Future<Either<Failure, List<WeatherDaily>>> weatherDaily({
    required double lat,
    required double lon,
  });
}
