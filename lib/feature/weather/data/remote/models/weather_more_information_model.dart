import 'package:weather_app/feature/weather/domain/entities/more_information.dart';

class WeatherMoreInformationModel extends MoreInformation {
  const WeatherMoreInformationModel({
    required super.cityName,
    required super.cityId,
  });

  factory WeatherMoreInformationModel.fromJson(Map<String, dynamic> json) {
    return WeatherMoreInformationModel(
      cityName: json['city']['name'],
      cityId: json['city']['id'],
    );
  }
}
