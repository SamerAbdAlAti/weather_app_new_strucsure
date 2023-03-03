import 'package:dartz/dartz.dart';
import 'package:weather_app/core/app/domain/use_cases/base_use_case.dart';
import 'package:weather_app/core/app/presentation/manager/error/server_failure.dart';
import 'package:weather_app/feature/weather/domain/entities/more_information.dart';
import 'package:weather_app/feature/weather/domain/repositories/base_weather_repository.dart';
import 'package:weather_app/feature/weather/domain/use_cases/get_weather_by_lat_lon_use_case.dart';

class GetMoreInformationUseCase
    extends BaseUseCase<MoreInformation, LocationInformationParameter> {
  final BaseWeatherRepository baseWeatherRepository;

  GetMoreInformationUseCase(this.baseWeatherRepository);

  @override
  Future<Either<Failure, MoreInformation>> call(
      {required LocationInformationParameter parameter}) async {
    return await baseWeatherRepository.getMoreInformation(
        lat: parameter.lat, lon: parameter.log);
  }
}
