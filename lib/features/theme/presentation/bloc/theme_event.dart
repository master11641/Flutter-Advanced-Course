part of 'theme_bloc.dart';

abstract class ThemeEvent extends Equatable {
  final int themeIndex;
  const ThemeEvent({required this.themeIndex});
  @override
  List<Object> get props => [themeIndex];
}
class ChangeEvent extends ThemeEvent{
  ChangeEvent({required super.themeIndex} );

}