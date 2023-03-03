import '../../../../../core/utils/cache_helper.dart';
import '../models/location_cache_model.dart';

abstract class BaseWeatherLocalDataSource {
  Future<LocationCacheModel> getLocationFromCache();
}

class WeatherLocalDataSource extends BaseWeatherLocalDataSource {
  @override
  Future<LocationCacheModel> getLocationFromCache() async {
    final lat = CacheHelper.getDouble(key: 'lat');
    final lon = CacheHelper.getDouble(key: 'lon');
    return LocationCacheModel(lat: lat, lon: lon);
  }
}
