import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/core/app/presentation/manager/service_locator/service_locator.dart';
import 'package:weather_app/core/share/style/style.dart';
import 'package:weather_app/core/utils/cache_helper.dart';
import 'package:weather_app/feature/weather/presentation/manager/cubit/weather_cubit.dart';
import 'package:weather_app/feature/weather/presentation/manager/service_locator/weather_service_locator.dart';
import 'core/app/presentation/manager/cubit/app_cubit.dart';
import 'core/app/presentation/manager/cubit/bloc_observer.dart';
import 'feature/weather/presentation/pages/weather_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await CacheHelper.init();
  await ServiceLocator.init();

  Bloc.observer = MyBlocObserver();
  getIt<WeatherCubit>();
  getIt<AppCubit>();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          lazy: false,
          create: (BuildContext context) =>
              getIt<WeatherCubit>()..getWeatherDailyMethod(),
        ),
        BlocProvider(
          create: (BuildContext context) => getIt<AppCubit>(),
        ),
      ],
      child: MaterialApp(
        title: 'Weather App',
        theme: AppStyle.lightTheme,
        darkTheme: AppStyle.darkTheme,
        themeMode: ThemeMode.light,
        home: const WeatherPage(),
      ),
    );
  }
}
