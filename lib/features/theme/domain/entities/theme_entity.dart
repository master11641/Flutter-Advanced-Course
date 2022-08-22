

import 'package:equatable/equatable.dart';
import '../../../../core/utils/my_theme.dart';



class ThemeEntity extends Equatable{
  String? name;
  MyTheme? theme;
  ThemeEntity({this.name, this.theme});
  
  @override
  // TODO: implement props
  List<Object?> get props => [name,theme];
}