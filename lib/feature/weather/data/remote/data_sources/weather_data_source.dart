import 'package:dio/dio.dart';
import 'package:weather_app/core/app/presentation/manager/error/server_exception.dart';
import 'package:weather_app/core/app/presentation/manager/net_work/error_message_model.dart';
import 'package:weather_app/core/utils/end_pints.dart';
import 'package:weather_app/feature/weather/data/remote/models/weather_daily_model.dart';

abstract class BaseWeatherRemoteDataSource {
  Future<List<WeatherDailyModel>> getWeatherByLatLon({
    required double lat,
    required double lon,
  });
}

class WeatherRemoteDataSource extends BaseWeatherRemoteDataSource {
  @override
  Future<List<WeatherDailyModel>> getWeatherByLatLon(
      {required double lat, required double lon}) async {
    final response = await Dio().get(
        "${EndPoints.baseUrl}/forecast?id=524901&lat=$lat&lon=$lon&appid=${EndPoints.apiKey}");
    if (response.statusCode == 200) {
      return List<WeatherDailyModel>.from(response.data['list'].map(
        (e) => WeatherDailyModel.fromJson(e),
      ));
    } else {
      throw ServerException(
          errorMessageModel: ErrorMessageModel.fromJson(response.data));
    }
  }
}
