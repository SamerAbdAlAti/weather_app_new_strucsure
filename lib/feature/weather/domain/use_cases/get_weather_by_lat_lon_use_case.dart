import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:weather_app/core/app/domain/use_cases/base_use_case.dart';
import 'package:weather_app/core/app/presentation/manager/error/server_failure.dart';
import 'package:weather_app/feature/weather/domain/entities/weather.dart';
import 'package:weather_app/feature/weather/domain/repositories/base_weather_repository.dart';

class GetWeatherByLatLonUseCase
    extends BaseUseCase<List<WeatherDaily>, LocationInformationParameter> {
  final BaseWeatherRepository baseWeatherRepository;

  GetWeatherByLatLonUseCase(this.baseWeatherRepository);

  @override
  Future<Either<Failure, List<WeatherDaily>>> call(
      {required LocationInformationParameter parameter}) async {
    return await baseWeatherRepository.weatherDaily(
      lat: parameter.lat,
      lon: parameter.log,
    );
  }
}

class LocationInformationParameter extends Equatable {
  final double lat;
  final double log;

  const LocationInformationParameter({
    required this.lat,
    required this.log,
  });

  @override
  List<Object> get props => [
        lat,
        log,
      ];
}
