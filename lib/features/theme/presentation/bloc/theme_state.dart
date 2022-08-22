part of 'theme_bloc.dart';

abstract class IThemeState extends Equatable {
  const IThemeState({required this.stateStatus, this.errorMessage,required this.entity});
  final Status stateStatus;
  final String? errorMessage;
  final ThemeEntity entity;
  @override
  List<Object> get props => [];
  IThemeState copyWith({required Status newState,String? newErrorMessage,ThemeEntity? newEntity});
}

class ThemeState extends IThemeState {
  const ThemeState({required super.stateStatus, super.errorMessage,required super.entity});  
  ThemeState copyWith({required Status newState,String? newErrorMessage,ThemeEntity? newEntity}){
        return ThemeState(stateStatus:  newState,errorMessage: newErrorMessage,entity: newEntity ?? entity);
  }

}
