part of 'weather_cubit.dart';

class WeatherState extends Equatable {
  final List<WeatherDaily> weatherDaily;
  final RequestState weatherDailyState;
  final String weatherDailyErrorMessage;
  final double lat;
  final double lon;
  final MoreInformation moreInformation;

  const WeatherState({
    this.weatherDaily = const [],
    this.weatherDailyState = RequestState.loading,
    this.weatherDailyErrorMessage = '',
    this.lat = 0.0,
    this.lon = 0.0,
    this.moreInformation = const MoreInformation(cityName: '', cityId: 0),
  });

  WeatherState copyWith({
    List<WeatherDaily>? weatherDaily,
    RequestState? weatherDailyState,
    String? weatherDailyErrorMessage,
    double? lat,
    double? lon,
    MoreInformation? moreInformation,
  }) {
    return WeatherState(
      weatherDaily: weatherDaily ?? this.weatherDaily,
      weatherDailyState: weatherDailyState ?? this.weatherDailyState,
      weatherDailyErrorMessage:
          weatherDailyErrorMessage ?? this.weatherDailyErrorMessage,
      lat: lat ?? this.lat,
      lon: lon ?? this.lon,
      moreInformation: moreInformation ?? this.moreInformation,
    );
  }

  @override
  List<Object> get props => [
        weatherDaily,
        weatherDailyState,
        weatherDailyErrorMessage,
        lat,
        lon,
        moreInformation,
      ];
}
