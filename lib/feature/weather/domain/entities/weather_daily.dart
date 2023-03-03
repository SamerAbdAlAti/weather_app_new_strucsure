part of 'weather.dart';

class WeatherDaily extends Equatable {
  final double tempMin;
  final String tempMax;
  final List<Weather> weather;
  final String date;

  const WeatherDaily({
    required this.tempMin,
    required this.tempMax,
    required this.weather,
    required this.date,
  });

  @override
  List<Object> get props => [
        tempMin,
        tempMax,
        weather,
        date,
      ];
}
