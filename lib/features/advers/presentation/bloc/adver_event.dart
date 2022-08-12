part of 'adver_bloc.dart';

@immutable
abstract class AdverEvent {}
class AdverFetchEvent extends AdverEvent {
  //  final int itemInPage;
  // final int pageNumber;

  // AdverFetchEvent({required this.itemInPage,required this.pageNumber});
 
}
class AdverFilterEvent extends AdverEvent {
// final FetchInputModel fetchInputModel;
//   AdverFilterEvent({required this.fetchInputModel}); 
}
