import 'package:equatable/equatable.dart';

class LocationCache extends Equatable {
  final double? lat;
  final double? lon;

  const LocationCache({
    required this.lat,
    required this.lon,
  });

  @override
  List<Object?> get props => [
        lat,
        lon,
      ];
}
