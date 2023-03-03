import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:weather_app/core/share/style/style.dart';

import 'core/app/presentation/manager/cubit/bloc_observer.dart';
import 'feature/weather/presentation/pages/weather_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Weather App',
      theme: AppStyle.lightTheme,
      darkTheme: AppStyle.darkTheme,
      themeMode: ThemeMode.light,
      home: const WeatherPage(),
    );
  }
}
