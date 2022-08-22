import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_advanced_course/core/utils/state_status.dart';
import 'package:flutter_advanced_course/features/theme/domain/entities/theme_entity.dart';
import 'package:flutter_advanced_course/features/theme/domain/use_cases/get_theme_usecase.dart';

import '../../../../core/resources/data_state.dart';

part 'theme_event.dart';
part 'theme_state.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  final GetThemeUseCase getThemeUseCase;
  ThemeBloc(this.getThemeUseCase) : super(ThemeState(stateStatus: Status.initial,entity: getThemeUseCase(index: 0).data!)) {
    on<ThemeEvent>((event, emit) {          
          //emit(state);
          DataState<ThemeEntity>  newDataState = getThemeUseCase(index: event.themeIndex);
          if(newDataState is DataSuccess){
            emit(state.copyWith(newState: Status.success, newEntity: newDataState.data!));
          }
    });
  }
}
