import 'package:weather_app/core/app/domain/use_cases/base_use_case.dart';
import 'package:weather_app/feature/weather/domain/repositories/base_weather_repository.dart';

import '../../../../core/app/domain/use_cases/cache_base_use_case.dart';
import '../entities/location_cache.dart';

class GetLocationFromCacheUseCase
    extends CacheBaseUseCase<LocationCache, NoParameter> {
  final BaseWeatherRepository baseWeatherRepository;

  GetLocationFromCacheUseCase(this.baseWeatherRepository);

  @override
  Future<LocationCache> call({required NoParameter parameter}) async {
    return await baseWeatherRepository.getLocationFromCache();
  }
}
