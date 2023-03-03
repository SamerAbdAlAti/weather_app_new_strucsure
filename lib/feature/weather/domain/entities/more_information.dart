import 'package:equatable/equatable.dart';

class MoreInformation extends Equatable {
  final int cityId;
  final String cityName;

  const MoreInformation({
    required this.cityName,
    required this.cityId,
  });

  @override
  List<Object> get props => [
        cityName,
        cityId,
      ];
}
