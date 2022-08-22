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
import 'package:flutter_advanced_course/features/theme/data/data_source/local/theme_provider.dart';
import 'package:flutter_advanced_course/features/theme/data/repository/theme_repositoryImpl.dart';
import 'package:flutter_advanced_course/features/theme/domain/use_cases/get_theme_usecase.dart';
import 'package:flutter_advanced_course/features/theme/presentation/bloc/theme_bloc.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() {
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AdverBloc(
              GetAdversUseCase(AdverRepositoryImpl(AdverApiProvider()))),
        ),
        BlocProvider(
          create: (context) => CategoryBloc(GetCategorysUseCase(
              CategoryRepositoryImpl(CategoryApiProvider()))),
        ),
        BlocProvider(
            create: (context) => ThemeBloc(
                GetThemeUseCase(ThemeRepositoryImpl(ThemeProvider()))))
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ThemeBloc, IThemeState>(
      listener: (context, state) {
      
      },
      builder: (context, state) {
        return MaterialApp(
            debugShowCheckedModeBanner: false,
            localizationsDelegates: const [
              GlobalCupertinoLocalizations.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
            ],
            supportedLocales: const [
              Locale("fa", "IR"),
              Locale("en", 'US'),
            ],
            locale: const Locale("fa", "IR"),
            theme: ThemeData(
              brightness: state.entity.theme!.brightness,
              primarySwatch: state.entity.theme!.primarySwatch,
              primaryColor:state.entity.theme!.primaryColor,
              textTheme: state.entity.theme!.textTheme
            ),
            home: AdverView());
          
      },
    );
  }
}
