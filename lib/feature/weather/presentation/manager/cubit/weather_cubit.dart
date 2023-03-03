import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:location/location.dart';
import 'package:weather_app/core/app/domain/use_cases/base_use_case.dart';
import 'package:weather_app/core/utils/cache_helper.dart';
import 'package:weather_app/feature/weather/domain/entities/more_information.dart';

import '../../../../../core/app/presentation/manager/requeast_state/enum_requeast_state.dart';
import '../../../domain/entities/weather.dart';
import '../../../domain/use_cases/get_location_from_cache_use_case.dart';
import '../../../domain/use_cases/get_more_information_use_case.dart';
import '../../../domain/use_cases/get_weather_by_lat_lon_use_case.dart';

part 'weather_state.dart';

class WeatherCubit extends Cubit<WeatherState> {
  final GetWeatherByLatLonUseCase getWeatherByLatLonUseCase;
  final GetLocationFromCacheUseCase getLocationFromCacheUseCase;
  final GetMoreInformationUseCase getMoreInformationUseCase;

  WeatherCubit({
    required this.getWeatherByLatLonUseCase,
    required this.getLocationFromCacheUseCase,
    required this.getMoreInformationUseCase,
  }) : super(const WeatherState());


  /// Get Location Method And Data
  ///
  ///
  /// TODO: تنساش تقسمهم
  Future<void> getWeatherDailyMethod() async {
    WidgetsFlutterBinding.ensureInitialized();
    final cache =
    await getLocationFromCacheUseCase(parameter: const NoParameter());
    emit(state.copyWith(
      lon: cache.lon,
      lat: cache.lat,
    ));
    print("********************************************1");
    print("********************************************2");
    emit(state.copyWith(
      weatherDailyState: RequestState.loading,
    ));
    Location location = Location();

    bool serviceEnabled;
    PermissionStatus permissionGranted;

    if (state.lat==0) {
      serviceEnabled = await location.serviceEnabled();
      if (!serviceEnabled) {
        serviceEnabled = await location.requestService();
        if (!serviceEnabled) {
          return;
        }
      }

      permissionGranted = await location.hasPermission();
      if (permissionGranted == PermissionStatus.denied) {
        permissionGranted = await location.requestPermission();
        if (permissionGranted != PermissionStatus.granted) {
          return;
        }
      }
      await location.getLocation().then((value) {
        CacheHelper.putDouble(key: "lat", value: value.latitude).then((index) {
          CacheHelper.putDouble(key: "lon", value: value.longitude)
              .then((indexTow) {
            emit(state.copyWith(lat: value.latitude, lon: value.longitude));
          });
        });
      });
    }

    final result = await getWeatherByLatLonUseCase(
      parameter: LocationInformationParameter(
        lat: state.lat,
        log: state.lon,
      ),
    );

    final moreInformation = await getMoreInformationUseCase(
      parameter: LocationInformationParameter(
        lat: state.lat,
        log: state.lon,
      ),
    );
    moreInformation.fold(
        (l) => {
              emit(state.copyWith(
                weatherDailyState: RequestState.error,
                weatherDailyErrorMessage: l.message,
              )),
            },
        (r) => {
          emit(state.copyWith(
            moreInformation: r
          )),
        });
    result.fold((l) {
      emit(
        state.copyWith(
          weatherDailyState: RequestState.error,
          weatherDailyErrorMessage: l.message,
        ),
      );
    }, (r) {
      emit(
        state.copyWith(
          weatherDailyState: RequestState.loaded,
          weatherDaily: r,
        ),
      );
    });
  }
}
