import 'package:flutter/cupertino.dart';
import 'package:get_it/get_it.dart';
import 'package:weather_app/core/app/presentation/manager/cubit/app_cubit.dart';

import '../../../../../feature/weather/presentation/manager/service_locator/weather_service_locator.dart';

GetIt getIt = GetIt.instance;

class ServiceLocator {
  static Future<void> init() async {
    WidgetsFlutterBinding.ensureInitialized();
    await WeatherServiceLocator.init(getIt: getIt);
    getIt.registerFactory(() => AppCubit());

  }
}
