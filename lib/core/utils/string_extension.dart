import 'package:intl/intl.dart';
extension StringExtension on String {
  int parseInt() {
    return int.parse(this);
  }

  double parseDouble() {
    return double.parse(this);
  }

  // String replaceNumberWithThreeDigitCommaSeprator() {
  //     final format = new NumberFormat("#,##0", "fa_IR");
  //     var initString = this;
  //      String? numberInString =  this.replaceAll(new RegExp(r'[^0-9]'),'');
  //      if(numberInString !=null){
  //       String? numberInString =  this.replaceAll(new RegExp(r'[0-9]'),numberInString!);
  //      }
  //       return this;
  // }
}
