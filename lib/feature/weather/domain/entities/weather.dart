import 'package:equatable/equatable.dart';
part 'weather_daily.dart';
class Weather extends Equatable {
  final int id;
  final String main;
  final String description;

  const Weather({
    required this.id,
    required this.main,
    required this.description,
  });

  @override
  List<Object> get props => [
        id,
        main,
        description,
      ];
}
