import 'package:flutter/material.dart';
import 'package:flutter_advanced_course/features/advers/data/data_source/remote/api_provider.dart';
import 'package:flutter_advanced_course/features/advers/data/repository/adver_repositoryImpl.dart';
import 'package:flutter_advanced_course/features/advers/domain/repository/adver_repository.dart';
import 'package:flutter_advanced_course/features/advers/domain/use_cases/get_advers_usecase.dart';
import 'package:flutter_advanced_course/features/advers/presentation/bloc/adver_bloc.dart';
import 'package:flutter_advanced_course/features/advers/presentation/widgets/adver_view.dart';
import 'package:flutter_advanced_course/features/category/data/data_source/remote/api_provider.dart';
import 'package:flutter_advanced_course/features/category/data/repository/category_repositoryImpl.dart';
import 'package:flutter_advanced_course/features/category/domain/use_cases/get_categories_usecase.dart';
import 'package:flutter_advanced_course/features/category/presentation/bloc/bloc/category_bloc.dart';
import 'package:flutter_advanced_course/features/feature_weather/data/data_source/remote/api_provider.dart';
import 'package:flutter_advanced_course/features/feature_weather/data/repository/weather_repositoryImpl.dart';
import 'package:flutter_advanced_course/features/feature_weather/domain/use_cases/get_current_weather_usecase.dart';
import 'package:flutter_advanced_course/features/feature_weather/presentation/bloc/home_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // GetCurrentWeatherUseCase getCurrentWeatherUseCase =
    //     GetCurrentWeatherUseCase(WeatherRepositoryImpl(ApiProvider()));
    // getCurrentWeatherUseCase.call('tehran');

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      localizationsDelegates: [
        GlobalCupertinoLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: [
        Locale("fa", "IR"),
        Locale("en", 'US'),
      ],
      locale: Locale("fa", "IR"),
      home: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => AdverBloc(
                GetAdversUseCase(AdverRepositoryImpl(AdverApiProvider()))),
          ),
              BlocProvider(
            create: (context) => CategoryBloc(
                GetCategorysUseCase(CategoryRepositoryImpl(CategoryApiProvider()))),
          ),
        ],
        child: AdverView(),
      ),
    );
  }
}
